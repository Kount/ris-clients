require 'kount/cart'
require 'kount/request'
require 'kount/request/update'
require 'kount/request/inquiry'
require 'uri'
require 'kount/utils/khash'
require 'net/https'


module Kount
  ##
  # This class is where the primary interaction with
  # the merchant integration will take place.
  class Client
    # Tells the RIS server to respond in JSON instead of key/value pairs
    # This cannot be overridden.
    RESPONSE_FORMAT = 'JSON'

    # RIS Version. Can be overridden my merchant if required.
    DEFAULT_VERSION = '0720'

    # Default endpoint for production. Used by the DEFAULT_OPTIONS
    ENDPOINT_PROD = 'https://risk.kount.net'

    # Default endpoint for test. Used by the TEST_DEFAULT_OPTIONS
    ENDPOINT_TEST = 'https://risk.test.kount.net'

    # Default params for production
    PROD_DEFAULT_OPTIONS = {
      endpoint: ENDPOINT_PROD,
      version: DEFAULT_VERSION,
      is_test: false,
      timeout: 10
    }

    # Default params for test if is_test is TRUE
    TEST_DEFAULT_OPTIONS = {
      endpoint: ENDPOINT_TEST,
      version: DEFAULT_VERSION,
      timeout: 10
    }

    # Initialize a client object
    #
    # Example usage
    #    {:merchant_id => "123456", :key => "trhvihsrihsta7ftadk6edkre7y8..."}
    #
    # @param params [Hash] Hash with merchant_id, ksalt and key, plus any
    # other optional params
    def initialize(params = {})
      @options = {}
      if params[:is_test]
        @options.merge!(TEST_DEFAULT_OPTIONS)
      else
        @options.merge!(PROD_DEFAULT_OPTIONS)
      end
      @options.merge!(params)
    end

    # Makes the call to the Kount RIS server
    #
    # @param request [Kount::Request] Kount inquiry or update object
    # @return [Hash] RIS response formatted into a native hash
    def get_response(request)
      payload = URI.encode_www_form(prepare_request_params(request))
      response = {}
      begin
        response = http.post(http_path, payload, http_headers).body
        JSON.parse(response)
      rescue StandardError
        # RIS errors do not come back as JSON, so just pass them along raw.
        response
      end
    end

    # Give the request object what it needs to know to process the params
    # to send to RIS.
    def prepare_request_params(request)
      request.prepare_params(version, merchant_id, RESPONSE_FORMAT, ksalt)
    end

    # Kount Merchant ID
    def merchant_id
      @options[:merchant_id]
    end

    # RIS Interface Version
    def version
      @options[:version]
    end

    # RIS Endpoint URL
    def endpoint
      @options[:endpoint]
    end

    # Timeout settings
    def timeout
      @options[:timeout]
    end

    # Merchant API for RIS acess
    def key
      @options[:key]
    end

    # Secret Kount salt for KHASH
    def ksalt
      @options[:ksalt]
    end

    # Is test or production setting
    def test?
      @options[:is_test]
    end

    private

    def endpoint_uri
      @endpoint_uri ||= URI(endpoint)
    end

    def http
      net_http = Net::HTTP.new(endpoint_uri.host, endpoint_uri.port)
      if endpoint_uri.scheme == 'https'
        net_http.use_ssl = true
        net_http.verify_mode = test? ? OpenSSL::SSL::VERIFY_NONE : OpenSSL::SSL::VERIFY_PEER
      end
      net_http.open_timeout = timeout
      net_http.read_timeout = timeout
      net_http
    end

    def http_headers
      {
        'Accept' => 'application/json',
        'Content-Type' => 'application/x-www-form-urlencoded',
        'User-Agent' => "SDK-RIS-Ruby/#{Config::SDK_VERSION}",
        'X-Kount-Api-Key' => key
      }
    end

    def http_path
      endpoint_uri.path.empty? ? '/' : endpoint_uri.path
    end
  end
end

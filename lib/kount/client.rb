require 'date'
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

    # Default endpoint for Payments Fraud by Kount 360 production. Used by the DEFAULT_OPTIONS
    PAYMENTS_FRAUD_API_ENDPOINT_PROD = 'https://api.kount.com/commerce/ris'

    # Default endpoint for Payments Fraud by Kount 360 test. Used by the TEST_DEFAULT_OPTIONS
    PAYMENTS_FRAUD_API_ENDPOINT_TEST = 'https://api-sandbox.kount.com/commerce/ris'

    # Default endpoint for Payments Fraud by Kount 360 production. Used by the DEFAULT_OPTIONS
    PAYMENTS_FRAUD_AUTH_ENDPOINT_PROD = 'https://login.kount.com/oauth2/ausdppksgrbyM0abp357/v1/token'

    # Default endpoint for Payments Fraud by Kount 360 test. Used by the TEST_DEFAULT_OPTIONS
    PAYMENTS_FRAUD_AUTH_ENDPOINT_TEST = 'https://login.kount.com/oauth2/ausdppkujzCPQuIrY357/v1/token'

    # Default params for production
    PROD_DEFAULT_OPTIONS = {
      endpoint: ENDPOINT_PROD,
      pf_api_endpoint: PAYMENTS_FRAUD_API_ENDPOINT_PROD,
      pf_auth_endpoint: PAYMENTS_FRAUD_AUTH_ENDPOINT_PROD,
      version: DEFAULT_VERSION,
      is_test: false,
      timeout: 10
    }

    # Default params for test if is_test is TRUE
    TEST_DEFAULT_OPTIONS = {
      endpoint: ENDPOINT_TEST,
      pf_api_endpoint: PAYMENTS_FRAUD_API_ENDPOINT_TEST,
      pf_auth_endpoint: PAYMENTS_FRAUD_AUTH_ENDPOINT_TEST,
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
      # Migration mode enabled
      @migration_mode_enabled = false
      @access_token = ''
      @token_expires_at = Time.now - 3600 # set to one hour ago to force refresh on first use
      @access_token_mutex = Mutex.new
      @token_expires_at_mutex = Mutex.new

      @options = {}
      migration_mode = params[:migration_mode_enabled]
      if migration_mode.nil?
        @migration_mode_enabled = false
      else
        @migration_mode_enabled = migration_mode.to_s.downcase == 'true'
      end

      if params[:is_test]
        @options.merge!(TEST_DEFAULT_OPTIONS)
      else
        @options.merge!(PROD_DEFAULT_OPTIONS)
      end

      @options.merge!(params)
    end

    def access_token
      @access_token_mutex.synchronize { @access_token }
    end

    def set_access_token(token)
      @access_token_mutex.synchronize { @access_token = token }
    end

    def token_expires_at
      @token_expires_at_mutex.synchronize { @token_expires_at }
    end

    def set_token_expires_at(token)
      @token_expires_at_mutex.synchronize { @token_expires_at = token }
    end

    # Makes the call to the Kount RIS server
    #
    # @param request [Kount::Request] Kount inquiry or update object
    # @return [Hash] RIS response formatted into a native hash
    # rubocop:disable Metrics/AbcSize
    def get_response(request)
      headers = {}
      if @migration_mode_enabled
        if token_expires_at.nil? || Time.now >= token_expires_at
          refresh_pf_auth_token
          if access_token.nil? || access_token == ''
            raise RuntimeError, 'Access token could not be retrieved'
          end
          headers = pf_http_headers
          headers.merge!({ 'Authorization' => "Bearer #{access_token}" })
        end
      else
        headers = http_headers
      end

      payload = URI.encode_www_form(prepare_request_params(request))
      response = {}
      begin
        resp = http.post(http_path.to_s, payload, headers)
        response = JSON.parse(resp.body)
      rescue StandardError => e
        puts e
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
      if @migration_mode_enabled
        return @options[:pf_client_id]
      end
      @options[:merchant_id]
    end

    # RIS Interface Version
    def version
      @options[:version]
    end

    # RIS Endpoint URL
    def endpoint
      if @migration_mode_enabled
        return @options[:pf_api_endpoint]
      end
      @options[:endpoint]
    end

    # Timeout settings
    def timeout
      @options[:timeout]
    end

    # Merchant API for RIS access
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

    # rubocop:disable Metrics/AbcSize
    def http
      if endpoint_uri.host.nil? || endpoint_uri.port.nil?
        raise ArgumentError, 'Invalid endpoint or port'
      end
      net_http = Net::HTTP.new(endpoint_uri.host.to_s, endpoint_uri.port)
      if endpoint_uri.scheme == 'https'
        net_http.use_ssl = true
        net_http.verify_mode = test? ? OpenSSL::SSL::VERIFY_NONE : OpenSSL::SSL::VERIFY_PEER
        OpenSSL::SSL::SSLContext::DEFAULT_PARAMS[:options] |= OpenSSL::SSL::OP_IGNORE_UNEXPECTED_EOF
      end
      net_http.open_timeout = timeout
      net_http.read_timeout = timeout
      net_http.ignore_eof = true
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

    def pf_http_headers
      {
        'Accept' => 'application/json',
        'Content-Type' => 'application/x-www-form-urlencoded',
        'User-Agent' => "SDK-RIS-Ruby/#{Config::SDK_VERSION}",
      }
    end

    # rubocop:disable Metrics/AbcSize
    def refresh_pf_auth_token
      payload = URI.encode_www_form({ grant_type: 'client_credentials', scope: 'k1_integration_api'})
      headers = { Authorization: "Basic #{@options[:pf_api_key]}", 'Content-Type': 'application/x-www-form-urlencoded' }
      uri = URI(@options[:pf_auth_endpoint])
      client = Net::HTTP.new(uri.host.to_s, uri.port)
      client.ignore_eof = true
      client.use_ssl = true
      response = client.post(uri.path.to_s, payload, headers)

      return unless response.code == '200'

      data = JSON.parse(response.body)
      expires_in = data['expires_in'].to_i
      set_access_token(data['access_token'])
      set_token_expires_at(Time.now + (expires_in - 60)) # less 60 seconds for latency
    end

    def http_path
      endpoint_uri.path.to_s.empty? ? '/' : endpoint_uri.path
    end
  end
end

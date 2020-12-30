require 'kount/security_mash'
module Kount
  ##
  # This class acts as an abstract class for each type of request.
  class Request
    attr_accessor :params

    # Initialize a Request object
    #
    # Example usage
    #    Not used directly. Use Inquiry or Update instead.
    #
    # @param initial_params [Hash] Initial params for request
    def initialize(initial_params = {})
      @params = initial_params
    end

    # Add params to the current request object
    # @param hash [Hash] Hash of values to be added
    def add_params(hash)
      @params.merge!(hash)
    end

    # This method creates the final state of the params collection such that
    # it can be sent to RIS. Items that are specific to either the Inquiry
    # or Update calls are delegated to the prepare_params method in each
    # respective class.
    #
    # @param version [String] RIS version
    # @param merchant_id [String] Merchant ID
    # @param response_format [String] Response format (JSON)
    # @param _ksalt [String] Kount supplied secret salt for KHASH
    def prepare_params(version, merchant_id, response_format, _ksalt = '')
      # The KSALT is not used here, however, it is used in the corresponding
      # subclass prepare_params methods.
      params.merge!(VERS: version, MERC: merchant_id, FRMT: response_format)
    end
  end
end

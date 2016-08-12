require 'kount/client'
require 'kount/payment_types'

##
# This module is the main entry point to the service wrapper.
# Its primary function is to collect the runtime options
# and return a Client object, on which all of the runtime
# integration takes place.
module Kount
  # Creates the client object
  #
  # Expected options include:
  #   options = {
  #     :merchant_id => "MERCHANT_ID" # required (6 digit number)
  #     :ksalt => "KSALT" # required (provided by Kount)
  #     :key => "RIS_KEY" # required (created in the AWC web app)
  #     :endpoint => "RIS_ENDPOINT" # optional (default https://risk.kount.net)
  #     :version => "RIS_VERSION" # optional (defaults "0630")
  #     :is_test => "IS_TEST" # optional (defaults to false)
  #    }
  # @param options Hash
  def new(options = {})
    fail ArgumentError, 'Config options required' if options.empty?
    Client.new(options)
  end

  module_function :new
end

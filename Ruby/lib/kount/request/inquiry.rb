module Kount
  ##
  # This class extends the Request class.
  class Inquiry < Request
    attr_accessor :cart

    # Initialize an Inquiry object
    #
    # Example usage
    #    {:MACK => "Y", :AUTH => "A"}
    #
    # @param initial_params [Hash] Initial params for request
    def initialize(initial_params = {})
      super(initial_params)
      @cart = Cart.new
      # We want Request to default to MODE Q unless a different mode has
      # been passed.
      add_params(MODE: 'Q') unless initial_params.key?(:MODE)
    end

    # @param version [String] RIS version
    # @param merchant_id [String] Merchant ID
    # @param response_format [String] Response format (JSON)
    # @param ksalt [String] Kount supplied secret salt for KHASH
    def prepare_params(version, merchant_id, response_format, ksalt)
      super(version, merchant_id, response_format, ksalt)
      begin
        params.merge! collect_cart_items
        # The Kount::Request has no knowledge of the KSALT or merchant_id, both
        # of which are needed for KHASH. Request form params have everything we
        # need at this point to do the KHASH if needed.
        fixup_payment_params(ksalt, merchant_id)
      end
      params
    end

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def fixup_payment_params(ksalt, merchant_id)
      ptok = params[:PTOK]
      case params[:PTYP]
      when 'CARD', 'TOKEN'
        #ptok = Kount::SecurityMash.hash_credit_card(ptok, ksalt)
        ptok = Kount::Khash.hash_payment_token(ptok, ksalt)
        params.merge!(PTOK: ptok, PENC: 'KHASH')
      when 'GIFT', 'OTHER'
        #ptok = Kount::SecurityMash.hash_gift_card(ptok, ksalt, merchant_id)
        ptok = Kount::Khash.hash_gift_card(ptok, ksalt, merchant_id)
        params.merge!(PTOK: ptok, PENC: 'KHASH')
      when 'CHEK', 'OTHER'
        ptok = Kount::Khash.hash_check_payment(ptok, ksalt)
        params.merge!(PTOK: ptok, PENC: 'KHASH')
      when 'NONE'
        params.merge!(PTOK: nil, PENC: nil)
      else
        params[:PENC] ||= 'NONE'
      end
    end

    # Pulls the cart data into the request params hash
    def collect_cart_items
      {
        PROD_TYPE: cart.get_item(:TYPE),
        PROD_DESC: cart.get_item(:DESC),
        PROD_ITEM: cart.get_item(:ITEM),
        PROD_PRICE: cart.get_item(:PRICE),
        PROD_QUANT: cart.get_item(:QUANT)
      }
    end

    # Puts the cart object into the request for processing
    # @param cart [Kount::Cart] Cart object
    def add_cart(cart)
      @cart = cart
    end

    # Add UDF to request
    # @param name [String] UDF label name
    # @param value [String] UDF value
    def add_udf(name, value)
      @params.merge!("UDF[#{name}]" => value)
    end

    # Convenience method to create the payment params
    # @param type [String] Payment type
    # @param token [String] Payment token
    def add_payment(type, token = '')
      add_params(PTYP: type, PTOK: token)
    end
  end
end

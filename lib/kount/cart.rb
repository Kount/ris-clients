module Kount
  ##
  # This class handles cart data until the get_request is ready
  # to push the data into the form fields
  class Cart
    attr_accessor :items

    # Initialize cart object
    def initialize
      @items = []
    end

    # Add cart items
    #
    # @param item [String] Cart item name
    # @param type [String] Cart type name
    # @param desc [String] Cart item long description
    # @param quant [String] Cart item quantity
    # @param price [String] Cart item price in cents
    def add_item(item, type, desc, quant, price)
      @items << { TYPE: type,
                  DESC: desc,
                  ITEM: item,
                  QUANT: quant,
                  PRICE: price }
    end

    # Initialize an Inquiry object
    #
    # @param param [String] Param type: :TYPE, :DESC, :ITEM, :PRICE, or :QUANT
    # @return [Array] Ordered array of the cart contents for each param type
    def get_item(param)
      @items.collect { |item| item[param] }
    end
  end
end

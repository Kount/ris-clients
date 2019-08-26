# Kount Complete RIS Wrapper
[![Gem Version](https://badge.fury.io/rb/kount_complete.svg)](http://badge.fury.io/rb/kount_complete)

## Description
The official Kount Complete RIS wrapper. It provides simple methods to execute RIS calls.

## Philosophy

The idea behind the `kount_complete` gem for Ruby is to provide an easy-to-configure wrapper to the transport layer
for RIS. All interaction with the wrapper is done using native Ruby Hashes and Arrays instead of enforcing
rigid getters and setters for every RIS element. This allows a merchant to integrate the gem using the current version
and then easily access new functionality with the original gem as new RIS versions are released.

## Installation

    gem install kount_complete

## Usage

    require 'kount'
    client = Kount.new(options)


## Runtime Configuration
#### Create client object
Does not matter how you handle your config params (yaml/scripted/etc) so long as you provide the Kount class a 
hash with: `:merchant_id`, `:ksalt`, and `:key`. This minimal config will default to production settings.

    options = {
    	merchant_id: MERCHANT_ID,  #required (6 digit number, assigned by Kount)
    	key:         KEY,          #required (created in the AWC web app by merchant)
    	ksalt:       KSALT        #required (provided by Kount)
    }
    client = Kount.new(options)

There are additional params that are optional depending on your setup
and environment (test, beta, other).

* `:is_test`        _(defaults to `false`)_
* `:endpoint`   _(defaults to production value)_
* `:version`        _(defaults "`0630`")_

When `:is_test` is omitted or set to `false`, the RIS endpoint will default to production values. When `:is_test` is set to `true`, the RIS endpoint will default to Kount test server settings; however, both endpoints can be overridden if needed.

The key required for RIS is defined by the merchant in the Kount AWC.

The `:version` is to specify which version of the RIS interface is being called. Newer interface versions might require additional paramaters in the client.get_response call and may also provide additional/different return parameters. Only change the ```:version``` if you know what you're doing.

## Example RIS Calls
#### Inquiry (Mode Q)

    client = Kount.new(options)

A hash can be provided during object creation:

    inquiry = Kount::Inquiry.new(
        SITE: "DEFAULT",
        MACK: "Y",
        AUTH: "A",
        ORDR: "3458",
        TOTL: "5000",
        EMAL: "joe@example.com"
        )
	
_**NOTE**: The `Kount::Inquiry.new()` will automatically set the following params based on your configuration settings: `:MERC`, `:MODE`, `:VERS` and `:FRMT`._

Additional params can be added using a hash:

    inquiry.add_params(CURR: "USD", IPAD: "127.0.0.1", SESS: "456789y0nn87tn")

The add_payment method is provided to encapsulate the KHASH logic for credit cards, gift cards and other payment types. 
It handles the setting of: `:PTYP`, `:PTOK` and `:PENC` when needed. `Kount::PaymentTypes` is a set of constants defined 
with supported payment types.

    inquiry.add_payment(Kount::PaymentTypes::CREDIT_CARD, "4359873465893466783")

Every Inquiry (mode Q) requires cart data. Use the `add_item` and `add_cart` to simplify the conversion 
to form data. It handles the setting of: `:PROD_TYPE`, `:PROD_DESC`, `:PROD_ITEM`, `:PROD_PRICE`, and `:PROD_QUANT`

    cart = Kount::Cart.new()
    
The params are: ``cart.add_item(Type, Description, Item, Quantity, Price)``

    cart.add_item('64 inch LCD TV', 'Electronics', 'Television', '1', '45')
    cart.add_item('32 inch LCD TV', 'Electronics', 'Television', '44', '4564')
    cart.add_item('48 inch Plasma TV', 'Electronics', 'Television', '8', '765476')
    inquiry.add_cart(cart)

Just like with cart items, the form element formatting for UDFs can be tricky, so a quick
convenience method is available on the Request class for adding them.

    inquiry.add_udf('UDF_LABEL', 'UDF value')

The get_response is the first point at which the Kount server is contacted. Everything it needs to provide the response 
should be included in the inquiry payload. Response format is a native Ruby Hash.
    
    #response = client.get_response(inquiry)
	response = Response::Resp.new(client.get_response(inquiry))

#### Update (MODE U & X)

The `Kount::Update.new()` will automatically set the following params based on your configuration settings: `:MERC`, `:MODE`, `:VERS` and `:FRMT`.
The default is `MODE: 'U'` for `Kount::Update` so `MODE: 'X'` will need to be added manually if you need mode X.

    update = Kount::Update.new({
        TRAN: "30SP03DL69JS", # TRAN is one of the return values from a MODE Q call
        SESS: "456789y0n34b07y34n807yn87tn",
        MACK: "Y",
        AUTH: "D",
        ORDR: "3458",
        })
    #response = client.get_response(update)
	response = Response::Resp.new(client.get_response(update))

#### Inquiry (MODE J & W)

The `Kount::Inquiry.new()` will automatically set the following params based on your configuration settings: `:MERC`, `:VERS`, and `:FRMT`. 
However, you will need to provide your desired `:MODE` setting since it will otherwise default to Q. Also required for both
MODE J and W is the `:CUSTOMER_ID` param.

    inquiry = Kount::Inquiry.new({
        MODE: "J",
        CUSTOMER_ID: "Customer 1",
        })
    #response = client.get_response(inquiry)
	response = Response::Resp.new(client.get_response(inquiry))

#### Inquiry (MODE P)

Just like MODE J and W, you will need to provide your desired `:MODE` setting since it will otherwise default to Q.
Also required for MODE P is the `:ANID` param instead of the `:CUSTOMER_ID` param.

    inquiry = Kount::Inquiry.new({
        MODE: "P",
        ANID: "9991230000", # Phone number
        })
    #response = client.get_response(inquiry)
	response = Response::Resp.new(client.get_response(inquiry))

## KHASH
#### Convert Credit Card number to KHASH without RIS_KEY or Endpoint configuration

The only required option setting for credit card KHASH is the KSALT. _The secret KSALT value is provided to clients only._

    Kount::SecurityMash.hash_credit_card(plain_text, ksalt)
    
For the GIFT payment type, a merchant id is also required.

    Kount::SecurityMash.hash_gift_card(plain_text, ksalt, merchant_id)



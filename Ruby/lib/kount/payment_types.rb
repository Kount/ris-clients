module Kount
  ##
  # Convenience class to provide a list of PTYP values
  class PaymentTypes
    # Credit card (VISA, MasterCard, Amercian Express, etc)
    CREDIT_CARD   = 'CARD'.freeze
    # Generic Token
    TOKEN   = 'TOKEN'.freeze
    # PayPal
    PAYPAL        = 'PYPL'.freeze
    # Check
    CHECK         = 'CHEK'.freeze
    # Merchant issued gift card (not the ones with VISA/MC on them)
    GIFT_CARD     = 'GIFT'.freeze
    # Carte Bleue
    CARTE_BLEUE   = 'CARTE_BLEUE'.freeze
    # Sofort
    SOFORT        = 'SOFORT'.freeze
    # Elv
    ELV           = 'ELV'.freeze
    # Poli
    POLI          = 'POLI'.freeze
    # Neteller
    NETELLER      = 'NETELLER'.freeze
    # Giropay
    GIROPAY       = 'GIROPAY'.freeze
    # BPay
    BPAY          = 'BPAY'.freeze
    # Interac
    INTERAC       = 'INTERAC'.freeze
    # Apple Pay
    APPLE_PAY     = 'APAY'.freeze
    # Skrill
    SKRILL        = 'SKRILL'.freeze
    # Moneybooker (basically another name for Skrill)
    MONEYBOOKERS  = 'SKRILL'.freeze
    # Mercado Pago
    MERCADO_PAGO  = 'MERCADE_PAGO'.freeze
    # Bill Me Later
    BILL_ME_LATER = 'BLML'.freeze
    # Google Checkout
    GOOGLE_CHECKOUT = 'GOOG'.freeze
    # Green Dot Money Pack
    GREEN_DOT_MONEY_PACK = 'GDMP'.freeze
    # Single Euro Payments Area
    SINGLE_EURO_PAYMENTS_AREA	=	'SEPA'.freeze
    # None
    NONE          = 'NONE'.freeze
    # Other
    OTHER         = 'OTHER'.freeze
  end
end

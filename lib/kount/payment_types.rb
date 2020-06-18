module Kount
  ##
  # Convenience class to provide a list of PTYP values
  class PaymentTypes
    # Credit card (VISA, MasterCard, Amercian Express, etc)
    CREDIT_CARD   = 'CARD'
    #Generic Token
    TOKEN   = 'TOKEN'
    # PayPal
    PAYPAL        = 'PYPL'
    # Check
    CHECK         = 'CHEK'
    # Merchant issued gift card (not the ones with VISA/MC on them)
    GIFT_CARD     = 'GIFT'
    # Carte Bleue
    CARTE_BLEUE   = 'CARTE_BLEUE'
    # Sofort
    SOFORT        = 'SOFORT'
    # Elv
    ELV           = 'ELV'
    # Poli
    POLI          = 'POLI'
    # Neteller
    NETELLER      = 'NETELLER'
    # Giropay
    GIROPAY       = 'GIROPAY'
    # BPay
    BPAY          = 'BPAY'
    # Interac
    INTERAC       = 'INTERAC'
    # Apple Pay
    APPLE_PAY     = 'APAY'
    # Skrill
    SKRILL        = 'SKRILL'
    # Moneybooker (basically another name for Skrill)
    MONEYBOOKERS  = 'SKRILL'
    # Mercado Pago
    MERCADO_PAGO  = 'MERCADE_PAGO'
    # Bill Me Later
    BILL_ME_LATER = 'BLML'
    # Google Checkout
    GOOGLE_CHECKOUT = 'GOOG'
    # Green Dot Money Pack
    GREEN_DOT_MONEY_PACK  =	'GDMP'
    # Single Euro Payments Area
    SINGLE_EURO_PAYMENTS_AREA	=	'SEPA'
    # None
    NONE          = 'NONE'
    # Other
    OTHER         = 'OTHER'
  end
end

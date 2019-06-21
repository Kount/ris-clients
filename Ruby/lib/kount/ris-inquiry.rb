require 'kount'


options = {
    merchant_id: 900431,  #required (6 digit number, assigned by Kount)
    key: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI5MDA0MzEiLCJhdWQiOiJLb3VudC4xIiwiaWF0IjoxNTU0MjYwMTE5LCJzY3AiOnsia2EiOm51bGwsImtjIjpudWxsLCJhcGkiOnRydWUsInJpcyI6dHJ1ZX19.d0_1SHKePnTjsKsiaE6JJonfbMuT8AlaCgnkFs1PwwA',  #required (created in the AWC web app by merchant)
    ksalt: '1b^jIFD)e1@<ZKuH"A+?Ea`p+ATAo6@:Wee+EM+(FD5Z2/N<'  ,      #required (provided by Kount)
    endpoint: 'https://risk.test.kount.net',
    version: '0630',
    is_test: true #RIS endpoint is set to Kount Test Server setting
}
client = Kount.new(options)
inquiry = Kount::Inquiry.new(
    SITE: "DEFAULT",
    MACK: "Y",
    AUTH: "A",
    ORDR: "3458",
    TOTL: "5000",
    EMAL: "sanjeev.kumar@intimetec.com",
    MODE:'Q'

)

inquiry.add_params(CURR:"USD", IPAD:"49.206.242.238",SESS:"70093SDDFDSFDSSDFS")
#inquiry.add_payment(Kount::PaymentTypes::CREDIT_CARD, "4111111111111111")
#inquiry.add_payment(Kount::PaymentTypes::GIFT_CARD, "4111111111111111")
inquiry.add_payment(Kount::PaymentTypes::CHECK, "01234567811111111111111")

cart = Kount::Cart.new()
cart.add_item('32 inch LCD TV', 'Electronics', 'Television', '44', '1000')
inquiry.add_cart(cart)
response = client.get_response(inquiry)
puts response.to_s()
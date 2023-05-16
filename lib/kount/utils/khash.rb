module Kount 
  module Khash
    # Hash a PAN.
    #
    # Preserves first six characters of the input so that hashed cards can be
    # categorized by Bank Identification Number (BIN).
    #
    # Example usage:
    #   hashed = Kount::Khash.hash_payment_token("4111111111111111", ksalt)
    #     Expect: 411111WMS5YA6FUZA1KC
    #
    # @param plain_text [String] String to be hashed
    # @param ksalt      [String] The kount khash salt provided by Kount
    #
    # @return [String] KHASH version of string
    def self.hash_payment_token(plain_text, ksalt)
      return plain_text if khashed?(plain_text)
      mashed = getkhash(plain_text, 14, ksalt)
      "#{plain_text[0..5]}#{mashed}"
    end

    # <b>DEPRECATED:</b> Use Kount::Khash.hash_payment_token instead.
    def self.hash_check_payment(plain_text, ksalt)
      warn "[DEPRECATION] use Kount::Khash.hash_payment_token instead"
      hash_payment_token(plain_text, ksalt)
    end

    # Hash a gift card number.
    #
    # Use the six characters of the merchant id so that hashed cards can be
    # unique across the entire domain.
    #
    # Example usage:
    #   hashed = Kount::SecurityMash.hash_gift_card("3245876", salt, "123456")
    #     Expect: 1234569HXH32Y5NNJCGB
    #
    # @param plain_text  [String] String to be hashed
    # @param ksalt       [String] The kount khash salt provided by Kount
    # @param merchant_id [String] The merchant id that will serve as the common domain of all gift
    #        cards
    #
    # @return [String] KHASH version of string
    def self.hash_gift_card(plain_text, ksalt, merchant_id)
      return plain_text if khashed?(plain_text)
      mashed = getkhash(plain_text, 14, ksalt)
      "#{merchant_id}#{mashed}"
    end

    # Compute a base64 hash of the provided data.
    #
    # @param data [String] Data to hash
    # @param len  [int]    Length of hash to retain
    # @param m    [String] The kount khash salt
    #
    # @return [String] Hashed data
    def self.getkhash(data, len, m)
      a = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
      r = Digest::SHA1.hexdigest("#{data}.#{m}")
      c = ''
      len = 17 if len > 17
      limit = 2 * len
      i = 0
      while i < limit
        c << a[r[i..i + 6].to_i(16) % 36]
        i += 2
      end
      c
    end

    # @param val [String] Token that may or may not be khashed
    # @return [Boolean] True if token is already khashed
    def self.khashed?(val)
      true if val =~ /(\d{6}[A-Z0-9]{14})/
    end
  end
end

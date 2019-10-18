require 'digest/sha1'
module Kount
  ##
  # This class implements the Kount KHASH for cards and gift cards.
  
  class SecurityMash
    # @param plain_text [String] String to be hashed
    # @param ptyp [String] Payment type code: CARD, GIFT, or OTHER
    # @return [String] KHASH version of string
    def self.hash_token(plain_text, ptyp, ksalt, merchant_id = '')
      if ptyp == 'CARD'
        hash_credit_card(plain_text, ksalt)
      else
        hash_gift_card(plain_text, ksalt, merchant_id)
      end
    end

    # Hash a credit card number.
    # Preserves first six characters of the input so that hashed cards can be
    # categorized by Bank Identification Number (BIN).
    #
    # Example usage:
    #   hashed = Kount::SecurityMash.hash_credit_card("4111111111111111")
    #     Expect: 411111WMS5YA6FUZA1KC
    #   hashed = Kount::SecurityMash.hash_credit_card("5199185454061655")
    #     Expect: 5199182NOQRXNKTTFL11
    #   hashed = Kount::SecurityMash.hash_credit_card("4259344583883")
    #     Expect: 425934FEXQI1QS6TH2O5
    #
    # @param plain_text [String] String to be hashed
    # @return [String] KHASH version of string
    def self.hash_credit_card(plain_text, ksalt)
      return plain_text if khashed?(plain_text)
      first_six = plain_text[0..5]
      mashed = mash(plain_text, 14, ksalt)
      "#{first_six}#{mashed}"
    end

    # Hash a gift card number.
    # Use the six characters of the merchant id so that hashed cards can be
    # unique across the entire domain.
    #
    # Example usage:
    #   hashed = Kount::SecurityMash.hash_gift_card("123456", "3245876")
    #     Expect: 1234569HXH32Y5NNJCGB

    # @param plain_text [String] String to be hashed
    # @return [String] KHASH version of string
    def self.hash_gift_card(plain_text, ksalt, merchant_id)
      mashed = mash(plain_text, 14, ksalt)
      "#{merchant_id}#{mashed}"
    end

    # Compute a base64 hash of the provided data.
    #
    # @param data [String] Data to hash
    # @param len [int] Length of hash to retain
    # @return [String] Hashed data
    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def self.mash(data, len, m)
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

    # end mash

    # @param val [String] Token that may or may not be khashed
    # @return [Boolean] True if token is already khashed
    def self.khashed?(val)
      true if val =~ /(\d{6}[A-Z0-9]{14})/
    end
  end # end KountSecurityMash
end

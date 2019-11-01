module Kount 
  class Khash
    # @param plain_text [String] String to be hashed
    # @param ptyp [String] Payment type code: CARD, GIFT, or OTHER
    # @return [String] KHASH version of string
    def self.hash_token(plain_text, ptyp, ksalt, merchant_id = '')
      if ptyp == 'CARD'
        HashPaymentToken(plain_text, ksalt)
      elsif ptyp == 'CHEK'
        HashCheckPayment(plain_text, ksalt)
      else
        HashGiftCard(plain_text, ksalt, merchant_id)
      end
    end

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

    def self.hash_payment_token(plain_text, ksalt)
      return plain_text if khashed?(plain_text)
      first_six = plain_text[0..5]
      mashed = getkhash(plain_text, 14, ksalt)
      "#{first_six}#{mashed}"
    end

    def self.hash_check_payment(plain_text, ksalt)
      return plain_text if khashed?(plain_text)
      first_six = plain_text[0..5]
      mashed = getkhash(plain_text, 14, ksalt)
      "#{first_six}#{mashed}"
    end

    def self.hash_gift_card(plain_text, ksalt, merchant_id)
      mashed = getkhash(plain_text, 14, ksalt)
      "#{merchant_id}#{mashed}"
    end

    # @param val [String] Token that may or may not be khashed
    # @return [Boolean] True if token is already khashed
    def self.khashed?(val)
      true if val =~ /(\d{6}[A-Z0-9]{14})/
    end

  end
end

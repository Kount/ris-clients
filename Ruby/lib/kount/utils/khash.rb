module Kount
  class NewKhash
    # @param plain_text [String] String to be hashed
    # @param ptyp [String] Payment type code: CARD, GIFT, or OTHER
    # @return [String] KHASH version of string
    def self.hash_token(plain_text, ptyp, ksalt, merchant_id = '')
      puts ptyp
      exit
      if ptyp == 'CARD'
        HashPaymentToken(plain_text, ksalt)
      elsif ptyp == 'CHEK'
        HashCheckPayment(plain_text, ksalt)
      else
        HashGiftCard(plain_text, ksalt, merchant_id)
      end
    end

    def self.getKhash(data, len, m)
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

    def self.HashPaymentToken(plain_text, ksalt)
      first_six = plain_text[0..5]
      mashed = getKhash(plain_text, 14, ksalt)
      "#{first_six}#{mashed}"
    end

    def self.HashCheckPayment(plain_text, ksalt)
      first_six = plain_text[0..5]
      mashed = getKhash(plain_text, 14, ksalt)
      "#{first_six}#{mashed}"
    end

    def self.HashGiftCard(plain_text, ksalt, merchant_id)
      mashed = getKhash(plain_text, 14, ksalt)
      "#{merchant_id}#{mashed}"
    end
  end
end
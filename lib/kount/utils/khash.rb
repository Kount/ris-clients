module Kount 
  module Khash
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
      first_six = plain_text[0..5]
      mashed = getkhash(plain_text, 14, ksalt)
      "#{first_six}#{mashed}"
    end

    def self.hash_gift_card(plain_text, ksalt, merchant_id)
      mashed = getkhash(plain_text, 14, ksalt)
      "#{merchant_id}#{mashed}"
    end
  end
end

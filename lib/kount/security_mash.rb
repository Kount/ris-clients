module Kount
  class SecurityMash

    # <b>DEPRECATED:</b> This function should not be used. It duplicates the concerns of Kount::Inquiry.fixup_payment_params.
    def self.hash_token(_plain_text, _ptyp, _ksalt, _merchant_id = '')
        raise "do not use this function, prefer to use Kount::Inquiry.fixup_payment_params"
    end

    # <b>DEPRECATED:</b> Use Kount::Khash.hash_payment_token instead.
    def self.hash_credit_card(plain_text, ksalt)
      warn "[DEPRECATION] use Kount::Khash.hash_payment_token instead"
      Kount::Khash.hash_payment_token(plain_text, ksalt)
    end
  
    # <b>DEPRECATED:</b> Use Kount::Khash.hash_gift_card instead.
    def self.hash_gift_card(plain_text, ksalt, merchant_id)
      warn "[DEPRECATION] use Kount::Khash.has_gift_card instead"
      Kount::Khash.hash_gift_card(plain_text, ksalt, merchant_id)
    end

    # <b>DEPRECATED:</b> Use Kount::Khash.hash_gift_card instead.
    def self.mash(data, len, m)
      warn "[DEPRECATION] use Kount::Khash.getkhash instead"
      Kount::Khash.getkhash(data, len, m)
    end
  end
end

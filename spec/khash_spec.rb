require 'spec_helper'

# This suite of tests focuses on the Encryption and the state of
# the client when initialized. The usage (kount/utils/khash) aspects
# of the client are covered in the client_spec.rb test suite.

describe "Test: Khash encode method do" do

  context "Hash Technique for encode text" do

    describe "Test the HashPaymentToken Method for Credit Card and others expect GIFT and CHEK" do
      it 'Test the encode method for the value Ruby' do
        expect(Kount::Khash.hash_payment_token('0123456789012', '')).to eq('012345KXMPHKZ0TRHEM1')
        expect(Kount::Khash.hash_payment_token('01234567890123', '')).to eq('012345KQ5PAC7HVKBAT3')
        expect(Kount::Khash.hash_payment_token('012345678901234', '')).to eq('012345F8MUPRSZL8KCXN')
        expect(Kount::Khash.hash_payment_token('0123456789012345', '')).to eq('012345XYMBWL4ZCSIIWX')
        expect(Kount::Khash.hash_payment_token('4111111111111111', '')).to eq('41111193FBKM1EIVIXVP')
        expect(Kount::Khash.hash_payment_token('01234567890123456', '')).to eq('012345BANCJVM7X3N3QT')
        expect(Kount::Khash.hash_payment_token('012345678901234567', '')).to eq('012345Y574RDYLFUAQTE')
        expect(Kount::Khash.hash_payment_token('0123456789012345678', '')).to eq('01234537NA7QSVDYFDGY')
        expect(Kount::Khash.hash_payment_token('01234567890123456789', '')).to eq('012345LHA7DT5VF4DUR1')
      end
    end
    
    describe "Test the HashGiftCard Method for Gift Card type" do
      it 'Test the HashGiftCard Method for GIFT CARD type' do
        expect(Kount::Khash.hash_gift_card('4111111111111111', '', '900431')).to eq('90043193FBKM1EIVIXVP')
      end
    end

  end

end


require 'spec_helper'

# This suite of tests focuses on the Encryption and the state of
# the client when initialized. The usage (kount/utils/khash) aspects
# of the client are covered in the client_spec.rb test suite.

describe "Test: Khash encode method do" do

  context "Hash Technique for encode text" do

    describe "Test the HashPaymentToken Method for Credit Card and others expect GIFT and CHEK" do
      it 'Test the encode method for the value Ruby' do
        expect(Kount::Khash.hash_payment_token('4111111111111111', '')).to eq('41111193FBKM1EIVIXVP')
      end
    end
    
    describe "Test the HashGiftCard Method for Gift Card type" do
      it 'Test the HashGiftCard Method for GIFT CARD type' do
        expect(Kount::Khash.hash_gift_card('4111111111111111', '', '900431')).to eq('90043193FBKM1EIVIXVP')
      end
    end

    describe "Test the HashCheckPayment Method" do
      it 'Test the HashCheckPayment Method for CHECK type' do
        expect(Kount::Khash.hash_check_payment('01234567811111111111111', '')).to eq('012345440GD428TF29K0')
      end
    end
  end

end


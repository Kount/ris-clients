#require 'spec_helper'
require 'kount/util/khash'
require 'kount/util/khash'
require 'kount'


# This suite of tests focuses on the Encryption and the state of
# the client when initialized. The usage (kount/util/khash) aspects
# of the client are covered in the client_spec.rb test suite.

describe "Test: Khash encode method" do
  before(:each) do
    #prepare a rocket for all of the tests
    @khash = Kount::Khash.new(900431, '4111111111111111', 'countris', '')
  end
  context 'Hash technique for encrypt text' do

    # Minimal core test. Test for data encryption.

    describe "Test the hash encode method" do

      it "Test the encode method for the value Ruby" do
        expect(@khash.getKhash('countris')).to eq('OBTLBDZTQG1G19')
      end
    end


    describe "Test the HashGiftCard encode method" do

      it "Test the encode method for the value Ruby" do
        expect(@khash.HashGiftCard()).to eq('900431OBTLBDZTQG1G19')
      end
    end

    describe "Test the HashPaymentToken encode method" do

      it "Test the encode method for the value Ruby" do
        expect(@khash.HashPaymentToken()).to eq('411111193FBKM1EIVIXVP')
      end
    end
  end
end

# New test cases
describe "Test: Khash encode method" do
  before(:each) do
    #prepare a rocket for all of the tests
    @khash = Kount::NewKhash.hash_token('4111111111111111', '', '', '900431')
  end
  context 'Hash technique for encrypt text' do

    describe "Test the HashGiftCard encode method" do

      it "Test the encode method for the value Ruby" do
        expect(Kount::NewKhash.HashGiftCard('4111111111111111', '', '900431')).to eq('90043193FBKM1EIVIXVP')
      end
    end

    describe "Test the HashPaymentToken encode method" do

      it "Test the encode method for the value Ruby" do
        expect(Kount::NewKhash.HashPaymentToken('4111111111111111', '')).to eq('41111193FBKM1EIVIXVP')
      end
    end

    describe "Test the HashCheckPayment encode method" do

      it 'Test the encode method for the value Ruby' do
        expect(Kount::NewKhash.HashCheckPayment('01234567811111111111111', '')). to eq("012345440GD428TF29K0")
      end
    end
  end
end


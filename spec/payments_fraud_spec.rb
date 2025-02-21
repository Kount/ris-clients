# frozen_string_literal: true

require 'spec_helper'


describe Kount do

  context 'configure kount with new settings' do
    pf_client_id = '123456789012345'
    subject {Kount.new(
      merchant_id: '123456',
      is_test: true,
      migration_mode_enabled: true,
      pf_client_id: pf_client_id,
      pf_api_key:  ''
    )}
    expected_endpoint = 'https://api-sandbox.kount.com/commerce/ris'
    expected_client_id = pf_client_id

    describe 'verify usage of PF values' do
      it 'returns the PF API endpoint' do
        expect(subject.endpoint).to eq(expected_endpoint)
        expect(subject.merchant_id).to eq(expected_client_id)
      end

    end
  end

  context 'happy path integration test' do
    subject { Kount.new(
      merchant_id: ENV["RIS_SDK_SANDBOX_MERCHANT_ID"] || '',
      key: ENV["RIS_SDK_SANDBOX_API_KEY"] || '',
      is_test: true,
      endpoint: 'https://risk.test.kount.net',
      migration_mode_enabled: true,
      pf_client_id: ENV["PF_CLIENT_ID"] || '',
      pf_api_key: ENV["PF_API_KEY"] || '',
      version: 0720
    ) }
    request = Kount::Inquiry.new
    request.add_payment('CARD', '7103387671500967')
    cart = Kount::Cart.new
    cart.add_item('Item1', 'Type1', 'Description1', '1', '1001')
    cart.add_item('Item2', 'Type2', 'Description2', '2', '1002')
    request.add_cart(cart)
    expected = %w[A D R]

    describe 'call PF RIS endpoint' do
      it 'calls PF endpoint and checks for successful response' do
        result = subject.get_response(request)
        expect(expected.find { |h| result['AUTO'] == h })
        expect(result).not_to eq({})
      end

    end

  end
end
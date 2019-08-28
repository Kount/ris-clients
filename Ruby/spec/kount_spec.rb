require 'spec_helper'

# This suite of tests focuses on the configuration params and the state of
# the client when initialized. The usage (cart/inquiry/get_response) aspects
# of the client are covered in the client_spec.rb test suite.
describe Kount do
  it 'raises ArgumentError when initialized with no options' do
    expect do
      Kount.new
    end.to raise_error(ArgumentError)
  end

  context 'initialized with a merchant id' do
    subject {Kount.new(merchant_id: '555556')}

    describe '#merchant_id' do
      it 'returns the initialized value' do
        expect(subject.merchant_id).to eq('555556')
      end
    end

    describe '#version' do
      it 'returns the initialized value' do
        expect(subject.version).to eq('0700')
      end
    end

    describe '#endpoint' do
      it 'returns the default production value' do
        expect(subject.endpoint).to eq('https://risk.kount.net')
      end
    end

    describe '#test?' do
      it 'returns the default production value' do
        expect(subject.test?).to eq(false)
      end
    end
  end

  context 'initialized with is_test' do
    subject {Kount.new(is_test: true)}

    describe '#endpoint' do
      it 'returns the default test value' do
        expect(subject.endpoint).to eq('https://risk.test.kount.net')
      end
    end

    describe '#test?' do
      it 'returns true' do
        expect(subject.test?).to eq(true)
      end
    end
  end

  context 'initialized with custom endpoint' do
    subject {Kount.new(endpoint: 'https://mycustom.endpoint.com')}

    describe '#endpoint' do
      it 'returns the custom value' do
        expect(subject.endpoint).to eq('https://mycustom.endpoint.com')
      end
    end

    # Even though we passed a custom endpoint, the test? is still important
    # becasue it controls the SSL cert verification settings.
    describe '#test?' do
      it 'returns false' do
        expect(subject.test?).to eq(false)
      end
    end
  end

  context 'initialized with api key' do
    subject {Kount.new(key: '1234567890987654321QWERTYUIOP')}

    describe '#key' do
      it 'returns the custom value' do
        expect(subject.key).to eq('1234567890987654321QWERTYUIOP')
      end
    end
  end
end

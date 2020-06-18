require 'spec_helper'

# The point of this suite is to test the *preparation* of the RIS call. It is
# not to validate the behaviour of RIS itself. For that type of test, refer
# to the RIS project.
describe Kount do
  # Minimal core test, not a valid RIS request because it does not contain
  # all the requisite params.
  ksalt = 'public-test-salt'
  context 'initialized with a merchant id only' do
    subject { Kount.new(merchant_id: '555556') }
    request = Kount::Inquiry.new
    expected = [[:MERC, '555556'],
                [:VERS, '0700'],
                [:FRMT, 'JSON']
               ]
    describe '#prepare_request' do
      it 'returns the prepared request for minimal data' do
        result = subject.prepare_request_params(request)
        expected.each do |e|
          expect(result[e[0]]).to eq(e[1])
        end
      end
    end
  end

  context 'merchant id and CARD payment' do
    subject { Kount.new(merchant_id: '555556', ksalt: ksalt) }
    request = Kount::Inquiry.new
    request.add_payment('CARD', '7103387671500967')
    expected = [[:PTYP, 'CARD'],
                [:PTOK, '710338010UCJ25C9JLKG'], # Using public salt
                [:PENC, 'KHASH']
               ]
    describe '#prepare_request' do
      it 'returns the prepared request for card data' do
        result = subject.prepare_request_params(request)
        expected.each do |e|
          expect(result[e[0]]).to eq(e[1])
        end
      end
    end
  end

  context 'merchant id and GIFT payment' do
    subject { Kount.new(merchant_id: '555556', ksalt: ksalt) }
    request = Kount::Inquiry.new
    request.add_payment('GIFT', '7103387671500967')
    expected = [[:PTYP, 'GIFT'],
                [:PTOK, '555556010UCJ25C9JLKG'], # Using public salt
                [:PENC, 'KHASH']
               ]
    describe '#prepare_request' do
      it 'returns the prepared request for GIFT payment data' do
        result = subject.prepare_request_params(request)
        expected.each do |e|
          expect(result[e[0]]).to eq(e[1])
        end
      end
    end
  end

  context 'merchant id and PayPal payment' do
    subject { Kount.new(merchant_id: '555556', ksalt: ksalt) }
    request = Kount::Inquiry.new
    request.add_payment('PYPL', 'N71033SDGKN87671500967')
    expected = [[:PTYP, 'PYPL'],
                [:PTOK, 'N71033SDGKN87671500967'], # Using public salt
                [:PENC, 'NONE']
               ]
    describe '#prepare_request' do
      it 'returns the prepared request for PayPal data' do
        result = subject.prepare_request_params(request)
        expected.each do |e|
          expect(result[e[0]]).to eq(e[1])
        end
      end
    end
  end

  # KOUNT-8973: unable to set mode X in constructor
  context 'merchant id and MODE X' do
    subject { Kount.new(merchant_id: '555556') }
    request = Kount::Update.new(MODE: 'X')
    expected = [[:MODE, 'X']
               ]
    describe '#prepare_request' do
      it 'returns the prepared request for MODE X' do
        result = subject.prepare_request_params(request)
        expected.each do |e|
          expect(result[e[0]]).to eq(e[1])
        end
      end
    end
  end

  # KOUNT-8971: mode U call is including a PENC value, call returns error
  context 'merchant id and Update call' do
    subject { Kount.new(merchant_id: '555556') }
    request = Kount::Update.new
    expected = [[:PTYP, nil],
                [:PTOK, nil],
                [:PENC, nil]
               ]
    describe '#prepare_request' do
      it 'returns the prepared request for Update' do
        result = subject.prepare_request_params(request)
        expected.each do |e|
          expect(result[e[0]]).to eq(e[1])
        end
      end
    end
  end

  context 'merchant id and NONE payment' do
    subject { Kount.new(merchant_id: '555556', ksalt: ksalt) }
    request = Kount::Inquiry.new
    request.add_payment('NONE')
    expected = [[:PTYP, 'NONE'],
                [:PTOK, nil],
                [:PENC, nil]
               ]
    describe '#prepare_request' do
      it 'returns the prepared request for NONE payment' do
        result = subject.prepare_request_params(request)
        expected.each do |e|
          expect(result[e[0]]).to eq(e[1])
        end
      end
    end
  end

  context 'merchant id and empty cart' do
    subject { Kount.new(merchant_id: '555556', ksalt: ksalt) }
    request = Kount::Inquiry.new
    cart = Kount::Cart.new
    request.add_cart(cart)
    expected = [[:PROD_TYPE, []],
                [:PROD_DESC, []],
                [:PROD_ITEM, []]
               ]
    describe '#prepare_request' do
      it 'returns the prepared request for PTYP=None data' do
        result = subject.prepare_request_params(request)
        expected.each do |e|
          expect(result[e[0]]).to eq(e[1])
        end
      end
    end
  end

  context 'merchant id and one cart item' do
    subject { Kount.new(merchant_id: '555556', ksalt: ksalt) }
    request = Kount::Inquiry.new
    cart = Kount::Cart.new
    cart.add_item('MyItem', 'TheType', 'A long description', '4', '9999')
    request.add_cart(cart)
    expected = [[:PROD_TYPE, ['TheType']],
                [:PROD_DESC, ['A long description']],
                [:PROD_ITEM, ['MyItem']],
                [:PROD_PRICE, ['9999']],
                [:PROD_QUANT, ['4']]
               ]
    describe '#prepare_request' do
      it 'returns the prepared request with single cart item' do
        result = subject.prepare_request_params(request)
        expected.each do |e|
          expect(result[e[0]]).to eq(e[1])
        end
      end
    end
  end

  context 'merchant id and two cart items' do
    subject { Kount.new(merchant_id: '555556', ksalt: ksalt) }
    request = Kount::Inquiry.new
    cart = Kount::Cart.new
    cart.add_item('Item1', 'Type1', 'Description1', '1', '1001')
    cart.add_item('Item2', 'Type2', 'Description2', '2', '1002')
    request.add_cart(cart)
    expected = [[:PROD_TYPE, %w(Type1 Type2)],
                [:PROD_DESC, %w(Description1 Description2)],
                [:PROD_ITEM, %w(Item1 Item2)],
                [:PROD_PRICE, %w(1001 1002)],
                [:PROD_QUANT, %w(1 2)]
               ]
    describe '#prepare_request' do
      it 'returns the prepared request with multiple cart items' do
        result = subject.prepare_request_params(request)
        expected.each do |e|
          expect(result[e[0]]).to eq(e[1])
        end
      end
    end
  end

  context 'merchant id and one UDF' do
    subject { Kount.new(merchant_id: '123456', ksalt: ksalt) }
    request = Kount::Inquiry.new
    request.add_udf('MYUDFLABEL', 'My UDF value')
    expected = [['MYUDFLABEL', 'My UDF value']
               ]
    describe '#prepare_request' do
      it 'returns the prepared request for UDF label' do
        result = subject.prepare_request_params(request)
        expected.each do |e|
          expect(result["UDF[#{e[0]}]"]).to eq(e[1])
        end
      end
    end
  end

  context 'merchant id and multiple UDFs' do
    subject { Kount.new(merchant_id: '123456', ksalt: ksalt) }
    request = Kount::Inquiry.new
    request.add_udf('MYUDFLABEL', 'My First UDF value')
    request.add_udf('ANOTHER_UDF', 'My Second UDF value')
    request.add_udf('SO_MANY_UDFS', 'My Third UDF value')
    expected = [['MYUDFLABEL', 'My First UDF value'],
                ['ANOTHER_UDF', 'My Second UDF value'],
                ['SO_MANY_UDFS', 'My Third UDF value']
               ]
    describe '#prepare_request' do
      it 'returns the prepared request for multiple UDF labels' do
        result = subject.prepare_request_params(request)
        expected.each do |e|
          expect(result["UDF[#{e[0]}]"]).to eq(e[1])
        end
      end
    end
  end
end

require 'spec_helper'

describe Kount do
  ksalt = 'public-test-salt'
  context 'mash credit cards' do
    describe '#mash card' do
      fixture_cards = [%w(7103387671500967 710338010UCJ25C9JLKG),
                       %w(5199185454061655 5199182QMVHKQ9X56M9X),
                       %w(4259344583883 425934CG9C5L4J9JU6W3),
                       %w(6495347478600780 649534VVS6JHO5CDQFIW),
                       %w(4990160432687370 499016QLDL0OP3SMX0MT),
                       %w(2630847576846156 263084CARRC9W3XDLS8R)
                      ]
      it 'returns the mashed value' do
        fixture_cards.each do |cardPair|
          expect(Kount::SecurityMash.hash_token(cardPair[0], 'CARD', ksalt))
            .to eq(cardPair[1])
        end
      end
    end

    describe '#mash cards that are already mashed' do
      # The mash should detect that the values are already in the KHASH format
      fixture_cards = [%w(499016QLDL0OP3SMX0MT 499016QLDL0OP3SMX0MT),
                       %w(425934CG9C5L4J9JU6W3 425934CG9C5L4J9JU6W3),
                       %w(710338010UCJ25C9JLKG 710338010UCJ25C9JLKG)]
      it 'returns the mashed value' do
        fixture_cards.each do |cardPair|
          expect(Kount::SecurityMash.hash_token(cardPair[0], 'CARD', ksalt))
            .to eq(cardPair[1])
        end
      end
    end

    describe '#mash gift cards' do
      merchant_id = '555555'
      fixture_cards = [%w(7388460E9D 555555UF1IG4DV7HRWN3),
                       %w(50906199 5555559JUX7H9KGJYHH8),
                       %w(41658068FC266C309 555555ZFV2XK4ELP9OMJ)]
      it 'returns the mashed value' do
        fixture_cards.each do |cardPair|
          expect(Kount::SecurityMash.hash_token(cardPair[0],
                                                'GIFT',
                                                ksalt,
                                                merchant_id))
            .to eq(cardPair[1])
        end
      end
    end
  end
end

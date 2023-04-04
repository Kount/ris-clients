require 'spec_helper'

describe "Test: Default Payment Encryption on Inquiry" do
    ksalt = 'public-test-salt'
    merc = '666666'
    penc = 'LITERALLY_ANY_PENC'
    ptok = '4111111111111111'
    khashed = '1GT5TSFM2T6HSX'

    context "ANY PTYP" do 
        ptyp = 'LITERALLY_ANY_PTYP'

        it 'should not change PTOK if PENC is provided' do
            inquiry = Kount::Inquiry.new(
              PTYP: ptyp,
              PENC: penc,
              PTOK: ptok
            )
            inquiry.fixup_payment_params(ksalt, merc)
            expect(inquiry.params[:PENC]).to eq(penc)
            expect(inquiry.params[:PTOK]).to eq(ptok)
            expect(inquiry.params[:PTYP]).to eq(ptyp)
        end

        it 'should not default PENC' do
            inquiry = Kount::Inquiry.new(
              PTYP: ptyp,
              PTOK: ptok
            )
            inquiry.fixup_payment_params(ksalt, merc)
            expect(inquiry.params[:PENC]).to eq(nil)
            expect(inquiry.params[:PTOK]).to eq(ptok)
            expect(inquiry.params[:PTYP]).to eq(ptyp)
        end
    end

    context "PTYP=CARD" do
      ptyp = 'CARD'

      it 'should not change PTOK if PENC is provided' do
        inquiry = Kount::Inquiry.new(
          PTYP: ptyp,
          PENC: penc,
          PTOK: ptok
        )
        inquiry.fixup_payment_params(ksalt, merc)
        expect(inquiry.params[:PENC]).to eq(penc)
        expect(inquiry.params[:PTOK]).to eq(ptok)
        expect(inquiry.params[:PTYP]).to eq(ptyp)
      end

      it 'should default to KHASH if PENC is not provided, and perform KHASH' do
        inquiry = Kount::Inquiry.new(
          PTYP: ptyp,
          PTOK: ptok
        )
        inquiry.fixup_payment_params(ksalt, merc)
        expect(inquiry.params[:PENC]).to eq('KHASH')
        expect(inquiry.params[:PTOK]).to eq("411111#{khashed}")
        expect(inquiry.params[:PTYP]).to eq(ptyp)
      end 

      it 'should not perform KHASH if PENC is set to KHASH' do
        inquiry = Kount::Inquiry.new(
          PTYP: ptyp,
          PENC: 'KHASH',
          PTOK: ptok
        )
        inquiry.fixup_payment_params(ksalt, merc)
        expect(inquiry.params[:PENC]).to eq('KHASH')
        expect(inquiry.params[:PTOK]).to eq(ptok)
        expect(inquiry.params[:PTYP]).to eq(ptyp)
      end
    end

    context "PTYP=CHEK" do
        ptyp = 'CHEK'

        it 'should not change PTOK if PENC is provided' do
            inquiry = Kount::Inquiry.new(
              PTYP: ptyp,
              PENC: penc,
              PTOK: ptok
            )
            inquiry.fixup_payment_params(ksalt, merc)
            expect(inquiry.params[:PENC]).to eq(penc)
            expect(inquiry.params[:PTOK]).to eq(ptok)
            expect(inquiry.params[:PTYP]).to eq(ptyp)
        end
    
        it 'should default to KHASH if PENC is not provided, and perform KHASH' do
          inquiry = Kount::Inquiry.new(
            PTYP: ptyp,
            PTOK: ptok
          )
          inquiry.fixup_payment_params(ksalt, merc)
          expect(inquiry.params[:PENC]).to eq('KHASH')
          expect(inquiry.params[:PTOK]).to eq("411111#{khashed}")
          expect(inquiry.params[:PTYP]).to eq(ptyp)
        end 
    
        it 'should not perform KHASH if PENC is set to KHASH' do
          inquiry = Kount::Inquiry.new(
            PTYP: ptyp,
            PENC: 'KHASH',
            PTOK: ptok
          )
          inquiry.fixup_payment_params(ksalt, merc)
          expect(inquiry.params[:PENC]).to eq('KHASH')
          expect(inquiry.params[:PTOK]).to eq(ptok)
          expect(inquiry.params[:PTYP]).to eq(ptyp)
        end
    end

    context "PTYP=GIFT" do
        ptyp = 'GIFT'

        it 'should not change PTOK if PENC is provided' do
            inquiry = Kount::Inquiry.new(
              PTYP: ptyp,
              PENC: penc,
              PTOK: ptok
            )
            inquiry.fixup_payment_params(ksalt, merc)
            expect(inquiry.params[:PENC]).to eq(penc)
            expect(inquiry.params[:PTOK]).to eq(ptok)
            expect(inquiry.params[:PTYP]).to eq(ptyp)
        end
    
        it 'should default to KHASH if PENC is not provided, and perform KHASH' do
          inquiry = Kount::Inquiry.new(
            PTYP: ptyp,
            PTOK: ptok
          )
          inquiry.fixup_payment_params(ksalt, merc)
          expect(inquiry.params[:PENC]).to eq('KHASH')
          expect(inquiry.params[:PTOK]).to eq("#{merc}#{khashed}")
          expect(inquiry.params[:PTYP]).to eq(ptyp)
        end 
    
        it 'should not perform KHASH if PENC is set to KHASH' do
          inquiry = Kount::Inquiry.new(
            PTYP: ptyp,
            PENC: 'KHASH',
            PTOK: ptok
          )
          inquiry.fixup_payment_params(ksalt, merc)
          expect(inquiry.params[:PENC]).to eq('KHASH')
          expect(inquiry.params[:PTOK]).to eq(ptok)
          expect(inquiry.params[:PTYP]).to eq(ptyp)
        end
    end

end
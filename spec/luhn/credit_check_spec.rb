require 'spec_helper'

module Luhn
  describe CreditCheck do

    describe '.valid?' do
      it 'returns true on a valid number' do
        credit_check = CreditCheck.new("4929735477250543")

        expect(credit_check.valid?).to eq(true)
      end

      it 'returns false on an invalid number' do
        credit_check = CreditCheck.new("5541801923795240")

        expect(credit_check.valid?).to eq(false)
      end

      it 'returns expected values for American Express card numbers' do
        valid = CreditCheck.new("342804633855673")
        invalid = CreditCheck.new("342801633855673")

        expect(valid.valid?).to eq(true)
        expect(invalid.valid?).to eq(false)
      end
    end
  end
end

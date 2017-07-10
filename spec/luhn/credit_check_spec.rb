require 'spec_helper'

module Luhn
  describe CreditCheck do

    describe '.valid?' do
      it 'returns true on a valid number' do
        credit_check = CreditCheck.new("4929735477250543")

        expect(credit_check.valid?).to eq(true)
      end
    end
  end
end

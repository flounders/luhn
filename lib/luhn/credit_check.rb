module Luhn
  class CreditCheck

    def initialize(account_number)
      @account_number = account_number
    end

    def valid?
      false
    end
  end
end

module Luhn
  class CreditCheck

    def initialize(account_number)
      @account_number = account_number
    end

    def valid?
      check_digit = @account_number[-1].to_i
      number = @account_number[0...-1].reverse.chars

      double_every_other(number, 0)
      sum = sum_number(number)

      find_check_digit(sum) == check_digit and
        validate_full_number(sum, check_digit)
    end

    def double_every_other(number, index)
      if x = number[index]
        x = x.to_i
        if index.even?
          x *= 2
        end
        number[index] = x
        double_every_other(number, index+1)
      end
    end

    def sum_number(array)
      sum = 0
      if x = array.pop()
        if x > 9
          sum += x / 10 + x % 10 + sum_number(array)
        else
          sum += x + sum_number(array)
        end
      end

      return sum
    end

    def find_check_digit(non_check_sum)
      10 - (non_check_sum % 10)
    end

    def validate_full_number(non_check_sum, check_digit)
      (non_check_sum + check_digit) % 10 == 0
    end
  end
end

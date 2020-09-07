# Luhn Algorithm
class Luhn
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def addends
    number.digits.map.with_index { |n, idx| idx.odd? ? frmtr(n) : n }.reverse
  end

  def valid?
    (checksum % 10).zero?
  end

  def checksum
    addends.sum
  end

  def self.create(digits)
    nums = (digits.to_s + '0').to_i
    loop do
      sample = new(nums)
      break if sample.valid?

      nums += 1
    end
    nums
  end

  private :number

  def frmtr(num)
    num *= 2
    num < 10 ? num : num - 9
  end
end

# frozen_string_literal: true

#
# The luhn formula is a simple checksum formula used to validate a variety of identification numbers.
#
# rightmost didit == 'check-digit'
#
# from right to left <-----#
# double the value of every SECOND DIGIT
# any digits >= 10   SUBTRACT -9 from the result
#
#    1111 becomes 2121
#    8763 becomes 7733      7733
#
# add all these digits together
# 6
# 20
#
# if TOTAL % 10 == 0 <insert check icon here> number is valid
#
# TASK:
#
# check if it's valid per luhn formula.
#
# "2323 2005 7766 3554" is valid
#
# can return the cheksum, or remainder from using the luhn method
#
# can add a check digit to make the number valid per the luhn fomular and return the original number plus that digit.
# "2323 2005 7766 3554" in response to "2323 2005 7766 355".
#
# ----CASES
#
# 12121
# 14141
#
# Step1. work on `#addends` instance method
#
# number, digits map with index, if index is even *2, if result >= 10 - 9
#

# Luhn Algorithm

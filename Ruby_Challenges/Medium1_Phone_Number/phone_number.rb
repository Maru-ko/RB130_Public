# frozen_string_literal: true

# Phone Number
class PhoneNumber
  BAD_NUMBER = '0000000000'
  attr_reader :stringnum, :number

  def initialize(stringnum)
    @stringnum = stringnum
    @number = final_number
  end

  def area_code
    number[0, 3]
  end

  def to_s
    number.sub(/^(\d{3})(\d{3})(\d{4})$/, '(\1) \2-\3')
  end

  private :stringnum

  def final_number
    return BAD_NUMBER if letters?

    phonenumber = stringnum.gsub(/[^0-9]/, '')
    evaluate(phonenumber)
  end

  def letters?
    stringnum.match?(/[a-z]+/)
  end

  def evaluate(num)
    if num.size == 10
      num
    elsif num.size == 11 && num[0] == '1'
      num[1..-1]
    else
      BAD_NUMBER
    end
  end
end

# number1 = PhoneNumber.new('11234567890')
# # '(123) 456-7890',
# puts number1

# p PhoneNumber.new('9876543210').area_code
# #assert_equal '987', number.area_code

#
# 1. if digits < 10 == BAD NUMBER
# 2. if digits == 10 == GOOD NUMBER!
# 3. if the firstnum == 1, and its 11 digits , cut 1 out, use last 10
# 4. if num == 11 and index[0] is not 1 == BAD NUMBER
# 5. if num > 11 == BAD NUMBER
#
#
# we need to filter out
# alphabet characters
#
# everythign else seems to be fair game
#
#
# we need to filter out if it is a good number first
#
# if it is `#number` will return the number with string digits
# BADNUMBER = '0' * 10
#

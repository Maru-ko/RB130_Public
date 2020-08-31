module ToRoman
NUMERALS = {'M' => 1000,'CM' =>  900,'D'  => 500,'CD' => 400,
       'C' => 100,'XC' => 90,'L' => 50,'XL' => 40, 'X' => 10,
                       'IX' => 9,'V' => 5,'IV' => 4,'I' => 1 
            }

  def to_roman
    number = self
    roman_numeral = ''

    NUMERALS. each do |roman_number, value|
      num_of_roman, remainder = number.divmod(value)
      roman_numeral << (roman_number * num_of_roman) if num_of_roman > 0
      number = remainder
    end
    roman_numeral
  end
end

class Integer
  include ToRoman
end

#p 50025.to_roman
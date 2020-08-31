class Trinary
  ACCEPTED_VALUES = %w(0 1 2)

  def initialize(strnum)
    @string_num = verify(strnum)
  end

  def to_decimal
    value = 0
    (0..max).each do |idx|
      num = string_num[idx]
        value += (num * 3 ** idx)
    end

    value
  end

  private 

  attr_reader :string_num

  def max
    string_num.size - 1
  end

  def verify(strnum)
    raise TypeError, 'Must string representation(s) of Integer(s) 0-2' unless strnum.instance_of?(String)
    
    return 0 unless  strnum.delete('0-2').empty?
    strnum.chars.map { |chr| ACCEPTED_VALUES.include?(chr) ? chr.to_i : 0 }.reverse
  end
end

# trinary = Trinary.new('112')

# p trinary.to_decimal
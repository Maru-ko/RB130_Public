class Octal
  NEGATE = %w(8 9 a z A Z)
  OCTALS = ('0'..'7').to_a
  def initialize(octal)
    @octal = get_octal(octal)
  end

  def to_decimal
    @octal.to_i(8)
  end

  def show_octal
    @octal
  end

  def get_octal(octal)
    raise TypeError, "Must be a string object" unless octal.instance_of?(String)
     
    nu_octal = octal.delete('^1-7')
    idxer = nu_octal[0]
    @octal =  OCTALS.include?(idxer) ? nu_octal : '0'
  end
end


octal = Octal.new('6789')

p octal.show_octal
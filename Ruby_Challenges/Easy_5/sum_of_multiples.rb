class SumOfMultiples

  def initialize(*values)
    @multiples = verify(values)
  end

  def to(num)
    (1...num).select { |n| multiples.any? { |x| (n % x ).zero? } }.inject(:+)
  end

  private

  attr_reader :multiples

  def verify(vals)
    vals.empty? ? [3, 5] : vals
  end

  def self.to(num)
    return 0 if num < 4
    self.new.to(num)
  end
end




# p SumOfMultiples.to(1)
# p SumOfMultiples.to(4)
# p SumOfMultiples.to(6)
# puts
# sagashi = SumOfMultiples.new(7, 13, 17)

# p sagashi.to(20)
# #p SumOfMultiples.new.multiples
# #p sagashi.multiples
# =begin
# we have to modify so that each index or element of arguments that is passed in is
# able to be divided by those arguments

# =end
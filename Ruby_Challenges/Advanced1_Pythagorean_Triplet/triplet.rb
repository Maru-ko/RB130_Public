class Triplet
  attr_reader :x, :y, :z

  def initialize(*numbers)
    @x = numbers[0]
    @y = numbers[1]
    @z = numbers[2]
  end

  def sum
    x + y + z
  end

  def product
    x * y * z
  end

  def pythagorean?
    a = x**2 + y**2
    b = z**2
    a == b
  end

  class << self
    def where(options)
      result = []
      max = options[:max_factor] || 10
      min = options[:min_factor] || 1
      sum = options[:sum]

      combinations(min.upto(max).to_a).each do |combo|
        triplet = Triplet.new(combo[0], combo[1], combo[2])

        if triplet.pythagorean?
          if sum
            result << triplet if triplet.sum == sum
          else
            result << triplet
          end
        end
      end
      result
    end

    def combinations(arr)
      arr.product(arr).product(arr)
         .map(&:flatten).map(&:sort).uniq
    end
  end
end

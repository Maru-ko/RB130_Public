class Triangle
  attr_reader :max

  def initialize(n)
    @max = n
  end

  def rows
    2.upto(max).reduce([[1]]) do |p_triangle|
      p_triangle << [1] + p_triangle
                          .last
                          .each_cons(2)
                          .map(&:sum) + [1]
    end
  end

  private :max
end

triangle = Triangle.new(5)
p triangle.rows
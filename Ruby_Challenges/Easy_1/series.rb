=begin

Let's begin by backengineering the test codes one by one.

1. we have a `simple_slices_of_one` method,
we instantiate a new `Series` object and pass in a string of numbers.

for this we need a constructor method so far, that takes in one argument
  `strdgt`

• we see that `Series#sclices(arg)` is called in this test method.
  lets implement a `#slices(n)` method with one parameter `n`

• we see that depending on the slice argument `n` for now, we have to provide and array
of arrays, with that size

i.e. 

we have to stop at idx-argument, if arugmetn is bigger than the possible slices raise an error

• lets have a **guard clause** that raises an `ArgumentError` if an argument of slices is less than `0` or
greater than the `strdgt` string length/size.

• if we need to break appart a string, lets have a guard clause that allows us to 

  ADJUST SLICES ARGUMNET -1
  Stop Index Iteration at CURRENT INDEX - (ADJUSTED ARGUMENT)

  break apart the strdgt by calling on a separator or `String#chars`

  iterate via this array, and convert each string represented integer to an actual `Integer`
  we can do this via our sweet shortcut `Array#map(&:to_i)` since each of these characters
    has this method in which it can be invoked on `to_i`

=end


class Series

  def initialize(strdgt)
    @strdgt = strdgt
    @max_size = get_max_size
  end

  def slices(n)
    verify_slice_argument(n)
    result = Array.new
    separated_string = strdgt.chars

    separated_string.map.with_index do |char, idx|
      break unless idx < (max_size - (n - 1))
      result << separated_string[idx,n].map(&:to_i)
    end
    result
  end

  private

  attr_reader :strdgt, :max_size

  def get_max_size
    strdgt.size
  end

  def verify_slice_argument(slices)
    raise ArgumentError if slices > max_size || slices.negative?
  end
end



# series = Series.new('01234')
# p series.slices(1)
# p series.slices(2)

# #p series.get_max_size
# p series.slices(3)
# p series.slices(4)
# p series.slices(5)
# #p series.slices(6)
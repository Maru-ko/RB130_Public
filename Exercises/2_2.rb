=begin
Zipper

=end

def zip(x, y)
  max = x.size - 1
  counter = 0
  z = Array.new
  until counter > max
    z << [x[counter], y[counter]]
    counter += 1
  end
  z
end



p zip([1, 2, 3], [4, 5, 6]) #== [[1, 4], [2, 5], [3, 6]]
p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

=begin











=end
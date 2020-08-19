def select(array)
  counter = 0
  result = []
  while counter < array.size do
    if yield(array[counter])
      result << array[counter]
    end
    counter += 1
  end

  result
end

a = [1, 2, 3, 4, 5]

p select(a) { |n| n.odd? }
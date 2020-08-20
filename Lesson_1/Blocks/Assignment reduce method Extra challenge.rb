def reduce(arg1, arg2=nil)
  counter = 0
  acc = arg2 == nil ? arg1[0].class == Integer ? 0 : arg1[0].class.new : arg2
  
  while counter < arg1.size
    element = arg1[counter]

    acc = yield(acc, element)
    counter += 1
  end

  acc
end

array = [1, 2, 3, 4, 5]

puts reduce(array) { |acc, num| acc + num }
puts reduce(array, 10) { |acc, num| acc + num }
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }
#puts reduce(array) { |acc, num| acc + num if num.odd? }
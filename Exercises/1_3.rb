=begin
Find Missing Numbers


input: sorted array of integers as an argument
output: array that includes all of the missing arguments (in order)
between first & last elements of the argument.



def missing(array)
  min = array[0]
  max = array[-1]
  new_array = (min..max).to_a
  result = []
  counter = 0
  # new_array.each do |num|
  #   result << num unless array.include?(num)
  # end
  loop do
    num = new_array[counter]
    result << num unless array.include?(num)
    counter += 1
    break if counter >= new_array.size - 1
  end
  result
end
=end

def missing(array)
  min, max = array[0], array[-1]
  new_array = (min..max).to_a
  result, counter = [], 0

  while counter < new_array.size - 1 do
    num = new_array[counter]
    result << num unless array.include?(num)
    counter += 1
  end

  result
end


p missing([-3, -2, 1, 5]) #== [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) #== []
p missing([1, 5]) #== [2, 3, 4]
p missing([6]) #== []
puts
p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

def test_time
  soon = Time.now
  yield
  now = Time.now
  puts "it took #{now - soon} to process this method."
end


test_time { missing([-3, -2, 1, 5]) }
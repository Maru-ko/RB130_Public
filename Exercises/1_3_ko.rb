def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

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


#it took 2.0e-06 to process this method.
#it took 3.1e-05 to process this method.
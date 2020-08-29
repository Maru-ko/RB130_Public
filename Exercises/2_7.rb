=begin
each with object

=end



def each_with_object(array, ds)
  return ds if array.empty?
  idx = 0

  if ds.instance_of?(Array)
    while idx < array.size
      yield(array[idx], ds)
      idx += 1
    end
   elsif ds.instance_of?(Hash)
    while idx < array.size
      yield(array[idx], ds)
      idx += 1
    end
  end
  ds
end


result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]
p result

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]
p result

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }
result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}

=begin











=end
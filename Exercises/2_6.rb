=begin
each_with_index

=end


def each_with_index(collection)
  idx = 0
  while idx < collection.length
    yield(collection[idx], idx)
    idx += 1
  end

  collection
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

p result
=begin











=end
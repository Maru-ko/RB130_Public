=begin
each_cons (part 1)




def each_cons(collection)
  max = collection.size - 2
  collection.each_with_index do |val, idx|
    if idx < max
      yield(val, idx)
    elsif idx >= max
      yield(val, collection[idx-1])
    end
  end
  nil
end
=end

def each_cons(array)
  array.each_with_index do |item, idx|
    break if idx + 1 >= array.size
    yield(item, array[idx + 1])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
hash == {'a' => 'b'}
p result == nil
=begin











=end
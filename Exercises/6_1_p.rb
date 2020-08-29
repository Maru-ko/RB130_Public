=begin


=end

factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

streamer = '=' * 10

# External iterators

6.times { |number| puts "#{number}! == #{factorial.next}" }
puts streamer
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts streamer
factorial.rewind
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts streamer

def factorial_method(num=0)
  return 1 if num.zero?
  (1..num).inject(:*)
end

# Internal iterators

factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end


=begin

`Enumerator` doesn't know when we're done iterating when using an external iterator.
With external iterators, we need to explicitly tell the `Enumerator` when we're done.
We do that by calling the `Enumerator#rewind` method.
`#rewind` doesn't tell the `Enumerator` when to stop iterating. It tells `Enumerator` to begin a new iteration.


`#each_with_index` is designed to work with `Enumerator` objects, therefore it used an internal iterator.
`#each_with_index` knows that it needs to call `#rewind` each time you invoke it.
When we invoke `#each_with_index`, it automaticaly calls `#rewind` and outputs the desired results.



=end
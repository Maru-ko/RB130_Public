=begin
Map

=end
def map(coll)
  result = Array.new
  (0..coll.size-1).each { |val| result << yield(coll[val]) }
  result
end



p map([1, 3, 6]) { |value| value**2 } #== [1, 9, 36]
p map([]) { |value| true } #== []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } #== ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } #== [[1], [1, 2, 3], [1, 2, 3, 4]]
puts
p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
=begin











=end
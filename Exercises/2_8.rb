=begin
max_by

=end


def max_by(array)
  return nil if array.empty?

  max = array[0]
  largest_value = yield(max)

  (1...array.size).each do |idx|
    element = array[idx]
    current_value = yield(element)
    if largest_value < current_value
      largest_value = current_value
      max = element
    end
  end
  max
end


p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil

=begin











=end
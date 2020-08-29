# Bubble Sort


def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |idx|
      if block_given?
        next if yield(array[idx-1]) <= yield(array[idx])
      else
        next if array[idx - 1] <= array[idx]
      end 

      array[idx - 1], array[idx] = array[idx], array[idx - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array
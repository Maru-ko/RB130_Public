factorial = Enumerator.new do |y|
  counter = 0
  loop do
  y << get_factorial(counter)
  counter += 1
  end
end

def get_factorial(num=0)
  return 1 if num.zero?
  (1..num).inject(:*)
end

def separator(char='=', n=26)
  puts char * n
end

6.times { |number| puts "#{number}! == #{factorial.next}"}
separator
6.times { |number| puts "#{number}! == #{factorial.next}"}
separator '~'
factorial.rewind
6.times { |number| puts "#{number}! == #{factorial.next}"}
separator '*', 30
factorial.each_with_index do |value, idx|
  puts "#{idx}! == #{value}"
  break if idx >= 10
end
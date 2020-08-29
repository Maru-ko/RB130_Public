=begin


=end


def factorial(num)
  return 1 if num == 0

  (1..num).inject(:*)
end



p factorial(5)


fib = Enumerator.new do |y|
  a = b = 1
  loop do
    y << a
    a, b = b, a + b
  end
end

p fib.take(15)
=begin




=end
# Nth Prime

class Prime
  extend Math
  def self.nth(number)
    raise ArgumentError unless number.positive?

    counter = 2
    prime_list = [counter]
    loop do
      break if prime_list.size == number

      counter += 1
      prime_list << counter if is_prime?(counter)
    end
    prime_list[-1]
  end

  def self.is_prime?(num)
    return false if num < 2

    (2..sqrt(num)).each { |n| return false if (num % n).zero? }
    true
  end
end

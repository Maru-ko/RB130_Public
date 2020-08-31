require 'prime'

class PerfectNumber

  def self.classify(num)
    raise StandardError, "Can't be less than 2" unless num > 1
    return 'deficient' if num.prime?
    sum = sum_of_factors(num)
    num == sum ? 'perfect' : sum > num ? 'abundant' : 'deficient'
  end

  def self.sum_of_factors(num)
    (1...num).select { |n| (num % n).zero? }.inject(:+)
  end
end


# p PerfectNumber.classify(13)
# p PerfectNumber.classify(28)
# p PerfectNumber.classify(12)
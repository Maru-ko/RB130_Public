# Palindrome Products

class Palindromes
  def initialize(nums)
    @nums = nums
    set_min_max_boss
  end

  def generate
    @palindromes = boss_array.repeated_combination(2)
                             .each_with_object({}) do |arr, hsh|
      theone = arr.inject(:*)
      hasher(hsh, theone, arr) if palindrome?(theone)
    end
  end

  def largest
    max_value = @palindromes.max
    Palindrome.new(max_value[0], max_value[1])
  end

  def smallest
    min_value = @palindromes.min
    Palindrome.new(min_value[0], min_value[1])
  end

  private

  attr_reader :nums, :min_f, :max_f, :boss_array, :palindromes

  def hasher(hsh, num, arr)
    hsh[num] ? hsh[num] << arr : hsh[num] = [arr]
  end

  def set_min_max_boss
    @min_f = nums[:min_factor] || 1
    @max_f = nums[:max_factor] || 99
    @boss_array = (min_f..max_f).to_a
  end

  def palindrome?(num)
    num = num.to_s
    num == num.reverse
  end
end

class Palindrome
  attr_reader :value, :factors

  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end

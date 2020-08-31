class Sieve

  def initialize(num)
    @range = get_range(num)
  end

  def primes
    @primes ? @primes : get_primes
  end

  def show_range
    range.clone
  end

  private

  attr_reader :range, :num

  def get_range(arg)
    raise TypeError, 'Must be an Integer larger than 1' unless arg.instance_of?(Integer) &&  arg > 1
    @num = arg
    (2..arg).to_a
  end

  def get_primes
    new_range = range.clone
    new_range.each { |pr| new_range.reject! { |n| (n != pr) && (n % pr).zero?} }
    @primes = new_range
  end
end


# sieve = Sieve.new(2000)

# p sieve.primes

# p sieve.show_range

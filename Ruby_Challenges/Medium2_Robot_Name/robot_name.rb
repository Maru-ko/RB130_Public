class Robot
  @@names = []

  ALPHA = ('A'..'Z').to_a
  NUMS = (0..9).to_a
  attr_reader :name

  def initialize
    random_name
  end

  def reset
    random_name
  end

  private

  def random_name
    name = generate_random_name
    loop do
      break unless @@names.include?(name)

      name = generate_random_name
    end
    @@names << name
    @name = name
  end

  def generate_random_name
    letters = ALPHA.sample(2)
    numbers = NUMS.sample(3)
    [letters, numbers].join
  end
end

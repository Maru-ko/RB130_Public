class Phone
  SCREENS = 1
  attr_reader :brand, :screen_amount

  def initialize(brand)
    @brand = brand
    @screen = SCREENS
  end

  def screen_amount
    @screen
  end
end
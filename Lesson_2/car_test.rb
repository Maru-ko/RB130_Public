require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_badwheels
    skip "気付かないフリをしていつまでも"
    carrie = Car.new
    assert_equal(3, carrie.wheels)
  end
end

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
  end

  def test_object_equality
    skip "飛ぶだす"

    car1 = Car.new
    car2 = Car.new

    assert_same(car1, car2)
  end
end

#Minitest is saying that it doesn't know how to assert value equality here.
require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test

  def setup
    @car = Car.new
  end
  # assert(test)
  def test_car_exists
    assert(@car)
  end
  # assert_equal(exp, act)
  def test_wheels
    assert_equal(4, @car.wheels)
  end
  # assert_nil(obj)
  def test_name_is_nil
    assert_nil(@car.name)
  end
  # assert_raises(*exp) { ... }
  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey")
    end
  end
  #assert_instance_of(cls, obj)
  def test_instance_of_car
    assert_instance_of(Car, @car)
  end
  # assert_includes(collection, obj)
  def test_includes_car
    arr = (1..3).to_a
    arr << @car

    assert_includes(arr, @car)
  end

end
require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  # assert(test)
  # assert - Fails unless `test` is truthy.
  def test_car_exists
    car = Car.new
    assert(car)
  end

  # assert_equal(exp, act)
  # Fails unless `exp == act`.
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  # assert_nil(obj)
  # Fails unless `obj` is `nil`.
  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end

  # assert_raises(*exp) { ... }
  # Fails unless block raises one of `*exp`.
  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey")
    end
  end

  # assert_instance_of(cls, obj)
  # Fails unless `obj` is an instance of `cls`.
  def test_instance_of_car
    car = Car.new
    assert_instance_of(Car, car)
  end
  # Test is more useful when dealing with inheritance.
  # This example is contrived

  # assert_includes(collection, ojb)
  # Fails unless `collection` includes `obj`.
  def test_includes_car
    car = Car.new
    arr = [1, 2, 3]
    arr << car

    assert_includes(arr, car)
  end
  # assert_includes calls assert_equal in its implementation, minitest counts that call.
  # as a separate assertion. For each assert_includes call, you will get 2 assertions, not 1.

end
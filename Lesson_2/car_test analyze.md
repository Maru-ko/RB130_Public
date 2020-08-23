```ruby
require 'minitest/autorun' # loads the necessary files from the `minitest` gem.

require_relative 'car' # we require the file that we are testing `car.rb`

class CarTest < Minitest::Test # we create our test class / we subclass from MiniTest::Test allowing our test class to inherit all the necessary methods for writing tests.
  def test_wheels # we are creating an instance method that starts with `test_` - Minitest will know that these methods are individual tests that need to be run.
    car = Car.new #Within each test we will need to first set up the appropriate data or objects to make assertions against.
    assert_equal(4, car.wheels) # We have first instantiated a `Car` object, then used the `Car` object to verify that the newly created object indeed has 4 wheels.
  end
end
```
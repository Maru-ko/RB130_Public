require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'cat'

class CatTest < MiniTest::Test
  def test_tails
    kits = Cat.new
    assert_equal(1, kits.tails)
  end
end
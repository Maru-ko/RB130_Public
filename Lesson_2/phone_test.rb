require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'phone'

class PhoneTest < MiniTest::Test
  def test_brand
    nokia = Phone.new('Nokia')
    assert_equal(String, nokia.brand.class)
  end

  def test_screen
    yeskia = Phone.new("Yeskia")
    assert_equal(1, yeskia.screen_amount)
  end
end
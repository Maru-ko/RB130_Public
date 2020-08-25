require 'minitest/autorun'

class EqualityTest < MiniTest::Test
  def test_value_equality
    str1 = 'hi there'
    str2 = 'hi there'
    str3 = str1.dup

    assert_equal(str1, str2) # assert_equal - value equality
    assert_same(str1, str1)  # assert_same - object equality
  end
end
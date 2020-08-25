require 'minitest/autorun'

class BogusTest < MiniTest::Test
  def test_object_equality
    one = 1
    two = 2
    number = 'one'
    word = 'one'

    assert_equal(number, word)
    assert_same(one, 1)
  end
end
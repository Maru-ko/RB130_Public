require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'labyrinth'

class LabTest < MiniTest::Test
  def test_tomaranaide
    rio = Labyrinth.new

    assert_equal("揺れていた", rio.tomaranaide)
  end

  def test_bowie
    david = Labyrinth.new

    assert_equal('David Bowie', david.bowie)
  end

  def test_make_music
    skip "I don't shake like jagger"
    mu = Labyrinth.new

    assert_equal('this is a test', mu.make_music)
  end
end
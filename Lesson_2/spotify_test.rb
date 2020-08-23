require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'spotify'

class SpotifyTest < Minitest::Test
  def test_music
    dokomo = Spotify.new

    assert_equal(:unlimited, dokomo.music)
  end

  def test_max_listens
    erina = Spotify.new

    assert_equal(1, erina.max_simultaneous)
  end

  def test_country_code
    skip "気付かないフリをしていつまでも！"
    masaki = Spotify.new

    assert_equal('USA', masaki.country_code)
  end

  def test_passwords
    dekinai = Spotify.new

    assert_equal(false, dekinai.same_passwords?)
  end

  def password
    chisaki = Spotify.new

    assert_equal('12345', chisaki.password)
  end
end
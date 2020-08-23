# Testing to see what happens with dynamic return values
require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'ipod'

class IpodTest < MiniTest::Test
  def test_gb
    pearpod = Ipod.new

    assert_equal(8||16||32, pearpod.gb)
  end

  def test_play_music
    tesuto = Ipod.new

    assert_equal("気付かないフリをしていつまでも！", tesuto.play_music)
  end

  def test_expensive_storage
    passpo = Ipod.new

    assert_equal("I offer a whole 32gb of storage space, however you can buy two Ipod's with my price tag!", passpo.expensive_storage)
  end

  def test_cheap_storage
    skip
    pineapple = Ipod.new
    assert_equal("I only offer 8gb of memory", pineapple.cheap_storage)
  end

end
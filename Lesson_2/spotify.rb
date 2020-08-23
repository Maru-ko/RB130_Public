class Spotify
  MAX = 1
  CHEAP_HEX = %w(h g f s x)

  attr_reader :music
  def initialize
    @music = :unlimited
    @password = password
  end

  def max_simultaneous
    MAX
  end

  def same_passwords?
    @password == password
  end

  def country_code
    'x-x'
  end

  private

  def password
    randie + hanabi + randie + hanabi + randie + hanabi + randie
  end

  def hanabi
    CHEAP_HEX.sample
  end

  def randie
    [rand(1..100), rand(200..3999), rand(22)]
    .sample
    .to_s
  end
end


# spotty = Spotify.new

# p spotty.password
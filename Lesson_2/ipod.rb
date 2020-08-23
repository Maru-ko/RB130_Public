class Ipod
  CHEAP = 8
  MEDIUM = 16
  BOSS = 32

  attr_reader :gb

  def initialize
    @gb = [CHEAP, MEDIUM, BOSS].sample
  end

  def play_music
    "気付かないフリをしていつまでも！" * rand(22)
  end

  def cheap_storage
    "I only offer #{CHEAP}gb of memory"
  end

  def expensive_storage
    "I offer a whole #{BOSS}gb of storage space, however you can buy two #{self.class}'s with my price tag!"
  end
end
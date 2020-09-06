class BeerSong
  def initialize
    @song_lyrics = all_the_lyrics
  end

  def lyrics
    all_the_lyrics
  end

  def verse(number)
    return words.split("\n\n")[-1] if number == 0
    result = separated.select { |ln| ln =~ /^#{number}\s\b/ }[0]
    result + "\n"
  end

  def verses(*nums)
    nums[0].downto(nums[-1]).map { |num| verse(num) }.join("\n")
  end

  private

  attr_reader :song_lyrics

  def words
    song_lyrics.clone
  end

  def separated
    words.split("\n\n")
  end

  def all_the_lyrics
    file = File.open('song_lyrics.txt', 'r')
    words = file.read
    file.close
    words
  end
end

class Anagram
  def initialize(str)
    @original = str
    @formatted = main_key(str)
  end

  def match(array)
    array.select do |word|
      @formatted == main_key(word) && @original != word
    end
  end

  private

  def main_key(str)
    if str.capitalize == str
      set_key(str.downcase).capitalize
    else
      set_key(str)
    end
  end

  def set_key(arg)
    arg.chars.sort.join
  end
end



# tome = Anagram.new('Orchestra')

# p tome.main_key('Orchestra')

# p tome.main_key('Carthorse')
# # p tome.match(%w(tan stand at))


# anagram = Anagram.new('ELBOW')

# p anagram.match(%w(BELOW BOWEL ELBOW elbow BOWLE BLOWE))

detector = Anagram.new('ELBOW')
p detector.match(%w(BELOW BOWEL ELBOW elbow Elbow Bowel))
#=> ["BELOW", "BOWEL"]


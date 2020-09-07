class PigLatin
  VOWELS = %w(a i u e o)

  def self.translate(words)
    words.split.map do |word|
      if weird_case?(word)
        word + 'ay'
      elsif word.include?('qu')
        word.sub(/^([^aieo]+)([aiueo])?(\w+)$/,'\2\3\1ay')
      else
        word.sub(/^([^aiueo]+)([aiueo])(\w+)$/, '\2\3\1ay')
      end
    end.join(' ')
  end

  def self.weird_case?(word)
    word.start_with?('xr') || 
      VOWELS.include?(word[0]) ||
      word[0] == 'y' && !VOWELS.include?(word[1])
  end
end

=begin


1. If a word begins with a [aiueo] add 'ay'

2. if a word begins with a consonant sound move it to the end and add 'ay'



From test cases

No instantiating of anew objects, rather calling methods on the class itself

PigLatin#translate(parameter)




=end

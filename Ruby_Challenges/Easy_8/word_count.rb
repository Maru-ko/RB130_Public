class Phrase

  def initialize(sentence)
    @sentence = sentence
  end

  def word_count
    format_sentence

    new_sentence.uniq.each_with_object({}) do |word, hsh|
      hsh[word] = new_sentence.count(word)
    end
  end

  private

  attr_reader :sentence, :new_sentence

  def format_sentence
    @new_sentence = sentence.downcase.scan(/\b[\w']+\b/)
  end
end


# phrase = Phrase.new("First: don't laugh. Then: don't cry.")
# counts = { 'first' => 1, "don't" => 2, 'laugh' => 1,
#   'then' => 1, 'cry' => 1 }
# p phrase.word_count

# phrase = Phrase.new('one,two,three')
# counts = { 'one' => 1, 'two' => 1, 'three' => 1 }
# p phrase.word_count


# phrase = Phrase.new("Joe can't tell between 'large' and large.")
# counts = {
#   'joe' => 1, "can't" => 1, 'tell' => 1,
#   'between' => 1, 'large' => 2, 'and' => 1 }

# p phrase.word_count

# #p phrase.word_count
# frozen_string_literal: true

class Scrabble
  attr_reader :word, :score

  SCRABBLE = {
    'A' => 1, 'E' => 1, 'I' => 1, 'O' => 1, 'U' => 1,
    'L' => 1, 'N' => 1, 'R' => 1, 'S' => 1, 'T' => 1,
    'D,' => 2, 'G' => 2,
    'B' => 3, 'C' => 3, 'M' => 3, 'P' => 3,
    'F' => 4, 'H' => 4, 'V' => 4, 'W' => 4, 'Y' => 4,
    'K' => 5,
    'J' => 8, 'X' => 8,
    'Q' => 10, 'Z' => 10
  }.freeze

  def initialize(word)
    @word = word
    @score = obtain_score
  end

  private :word

  def obtain_score
    return 0 if word.nil?
    clean_word.sum { |char| SCRABBLE[char] }
  end

  def clean_word
    word.gsub(/[^a-z]/i, '').upcase.chars
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

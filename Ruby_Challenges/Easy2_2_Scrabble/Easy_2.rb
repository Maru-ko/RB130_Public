=begin
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10

=end


one = %w(A E I O U L N R S T) 
two = %w(D, G)
three = %w(B C M P)
four = %w(F H V W Y)
five = %w(K)
eight = %w(J X)
ten = %w(Q Z )


list = {0=> 1, 1=>2, 2=>3, 3=> 4, 4=> 5, 5=>8, 6=> 10}

main_hash =[one, two, three, four, five, eight, ten].flat_map.with_index { |arr, idx| arr.map { |letter| [letter, list[idx]]}}.to_h


class Scrabble
  attr_reader :word, :score

  SCRABBLE = {
    "A"=>1, "E"=>1, "I"=>1, "O"=>1, "U"=>1, "L"=>1, "N"=>1, "R"=>1, "S"=>1, "T"=>1, 
    "D,"=>2, "G"=>2, 
    "B"=>3, "C"=>3, "M"=>3, "P"=>3, 
    "F"=>4, "H"=>4, "V"=>4, "W"=>4, "Y"=>4, 
    "K"=>5, 
    "J"=>8, "X"=>8,
     "Q"=>10, "Z"=>10 }

  def initialize(word)
    @word = word
    @score = get_score
  end

  private :word

  def get_score
    return 0 if word == nil
    @score = clean_word.sum { |x, y| SCRABBLE[x] }
  end

  def clean_word
    word.gsub(/[^a-z]/i, '').upcase.chars
  end
end



# SCRABBLE = {
#     "A"=>1, "E"=>1, "I"=>1, "O"=>1, "U"=>1, "L"=>1, "N"=>1, "R"=>1, "S"=>1, "T"=>1, 
#     "D,"=>2, "G"=>2, 
#     "B"=>3, "C"=>3, "M"=>3, "P"=>3, 
#     "F"=>4, "H"=>4, "V"=>4, "W"=>4, "Y"=>4, 
#     "K"=>5, 
#     "J"=>8, "X"=>8,
#      "Q"=>10, "Z"=>10 }
# def score(word)
#   return 0 if word == nil
#   formatted = word.gsub(/[^a-z]/i, '').upcase

#   formatted.chars.sum { |x, y| SCRABBLE[x] }
# end

# p score("cabbage")
# p score('')
# p score(" \t\n")
# p score(nil)
# p score 'a'
# p score 'f'
# p score('street')
# p score('quirky')
# p score('OXYPHENBUTAZONE')
# p score('alacrity')

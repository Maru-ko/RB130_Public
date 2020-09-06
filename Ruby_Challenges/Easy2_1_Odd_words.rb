=begin

happy paths?

fail paths*

edege cases√


PROBLEM:

Consider a character set consisting of letters, a space, and a point.
Words consist of one or more, but a most 20 letters. (1+ to 20max)
An input text consists of one or more words separated from each other by one or more spaces and terminated by zero or more spaces followed by a point.
Input should be read from, and including,the first letter of the first word, up to an including the terminating point.
The ouput text is to be produced such that successive words are separated by a single space with the last word being terminated by a single point.
Odd words are copies in reverse order while even words are merely echoed.
i.e. the input string

"whats the matter with kansas." "whats eht matter htiw kansas."

Bonus: the charaters must be read and printed one at a time.


we only have one example of edge case, so we will only go with that example, however It worries me that I wish we had more examples.
  Some questions would be, will the all have a `.` at the end? will they be multiline inputs?

ALGORITHM FOR ODD SIZE WORDS

• need to find a way to single out spaces
• separate words by spances
• if the last characters is not `.` then add it., the remove duplicates just in case.
    actually add a dot, and the single it out if there are duplicates.
• if the size of each space separated word i

ok so  if whole string last character is `.` remove it, then add it later

if a word has odd number of characters we reverse it, otherwise 'echo' it

string -> collection data structure: Array -> transformation: map -> formalize: joined elements by a single spaces -> add the period.

ALGORITHM FOR ODD WORDS

split string by spaces, remove duplicate spaces, iterate and check the data structures index, if its odd then reverse word, otherwise have the block return a copy of the word.


=end


def odd_size_words(string)
  str = string.squeeze(' ')
  str = str[-1] == '.' ? str[0...-1] : str
  result = str.split.map do |word|
    scanned = word.scan(/\b[a-z]+\b/i)[0].size
      if scanned.odd? 
        word.reverse
      else
        word
      end
    end
  result.join(' ')+ '.'
end


p odd_size_words("whats the matter with kansas.")
puts

def odd_words(string)
  str = string.squeeze(' ')
  str = str[-1] == '.' ? str[0...-1] : str
  cleaned = str.split.select { |word| word.size <= 20}
  result = cleaned.map.with_index do |word, idx|
    if idx.odd?# && word.size <= 20
      word.reverse
    elsif word.size# <= 20
      word
    end
  end
  result -= [nil]
  puts result
  result.join(' ') + '.'
end

p odd_words("whats the matter with kansas.")
p odd_words("whats the matter with kansas.") == "whats eht matter htiw kansas."
p odd_words("hello word.")
p odd_words("hello word .")
p odd_words("hello  word  .")
p odd_words("hello word world .")
p odd_words("In a glittering dream we have made a promise that one day") == "In a glittering maerd we evah made a promise taht one yad."
p odd_words("thisisatwentypluscharacterword and this is not a largeword")
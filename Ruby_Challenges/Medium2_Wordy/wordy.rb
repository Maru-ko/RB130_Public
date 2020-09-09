class WordProblem
  WORD_SYM = { 'plus' => :+, 'minus' => :-,
               'multiplied by' => :*, 'divided by' => :/ }

  def initialize(string)
    @problem = string
    number_operators
  end

  def answer
    any_empty?
    sum = numbers.shift
    numbers.each_with_index { |n, idx| sum = [sum, n].inject(operators[idx]) }
    sum
  end

  private

  attr_reader :numbers, :operators

  def number_operators
    @numbers = @problem.scan(/-?\d+/i).map(&:to_i)
    @operators = @problem.scan(/(plus|minus|multiplied by|divided by)+/i)
                         .flatten.map { |op| WORD_SYM[op] }
  end

  def any_empty?
    raise ArgumentError if numbers.empty? || operators.empty?
  end
end

# question = 'What is -12 divided by 2 divided by -3?'
# mondai = WordProblem.new(question)#.answer #2
# p mondai.answer

# questions = 'What is 2 multiplied by -2 multiplied by 3?'
# kanji = WordProblem.new(questions)
# p kanji.answer #-2

# whoa = WordProblem.new('What is 53 cubed?')#.answer

# whoa.answer
# # p whoa.numbers
# # p whoa.operators

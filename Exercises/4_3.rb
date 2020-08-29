=begin
#Passing Parameters Part 1

=end

items = %w(apples corn cabbage wheat)

def gather(array)
  puts "Let's start gathering food."
  yield(array) if block_given?
  puts "Nice selection of fodd we have gathered."
end

gather(items) { |produce| puts produce.join('; ') }

=begin











=end
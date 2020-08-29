# Exploring Procs, Lambdas, and Blocks: Definition and Arity
def streamer
  puts
  puts "=" * 26
  puts
end
# Group 1
avenue = "on `line 2`"
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call  # if nothing is passed then `nil` is assigned to the block variable.
avenue = 'yellowcard'
my_proc.call('cat')
my_proc.call(avenue)

streamer
# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call('[I gave this lambda an argument, because it gave me an `ArgumentError`]')
#my_third_lambda = Lambda.new { |thing| puts "This is a \#{thing}."  # A lambda can't be created with `Lambda.new`
error = %Q(my_third_lambda = Lambda.new { |thing| puts "This is a \#{thing}." })
puts error
#=> give us 'uninitialized constant Labmda (NameError)'

streamer
# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}." }

# block_method_1('seal')
puts %Q(block_method_1\('seal'\)) #=> no block given (yield) (LocalJumpError)

streamer
# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}." }
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end

# block_method_2('turtle') { puts "This is a #{animal}." }
#=> runs an error! because of no block parameter present
block_method_2('turtle') { |anything| puts "This is a #{anything}."}
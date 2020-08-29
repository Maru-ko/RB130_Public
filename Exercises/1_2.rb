#Optional Blocks
=begin
Write a method that takes an optional block.

if the block is specified, the method should execute it, and return the value returned by the block.

If no block is specified, the method should simple return the string `Doe not compute`

=end
def compute(arg1=nil)
  msg = "Does not compute."
  if arg1 && block_given?
    yield(arg1)
  elsif block_given?
    yield
  elsif arg1
    "#{msg[0..-2]} #{arg1}."
  else
    msg
  end
end



p compute('hi') { 5 + 3 } #== 8
p compute { 'a' + 'b' }# == 'ab'
p compute# == 'Does not compute.'
p compute('hello')
p compute { |n| 'no arguments' }
p compute('argument in the house') { |arg| arg }
p compute
puts
p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

=begin











=end
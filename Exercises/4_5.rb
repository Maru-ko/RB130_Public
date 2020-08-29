=begin
Passing Paramenter Part 3



=end
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end


gather(items) do |a, b, c, d|
  puts [a, b, c].join(', ')
  puts d
end
puts

gather(items) do |*a, d|
  puts [*a].join(', ')
  puts d
  end
puts

#2

gather(items) do | a, *b, c|
  puts a
  puts [*b[0,2]].join(', ')
  puts c
end
puts
#3
gather(items) do | a, *b|
  puts a
  puts [*b].join(', ')
end
puts

#4
gather(items) do | a, b, c, d|
  puts "#{[a, b, c].join(', ')}, and #{d}"
  end

=begin
that st anger song is the bomb digity na what I ams sayin?










=end
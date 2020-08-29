=begin
From-To-Step Sequence generator

=end

def step(x, y, by)
  sum = x
  until sum > y
    yield(sum)
    sum += by
  end
  (x..y)
end


step(1, 10, 3) { |value| puts "value = #{value}" }
=begin











=end
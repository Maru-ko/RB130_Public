=begin
Ruby treats block variables in much the same way it does during assignment from an array.

Ruby treats block variables in much the same way it does during assignment from an array.


=end

birds = %w(raven finch hawk eagle)

def types(birds)
  yield(birds)
end

types(birds) { |_, _, *raptors| puts "Raptors: #{raptors.join(', ')}." }

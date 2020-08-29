=begin


=end
birds = %W(raven finch hawk eagle)
p birds

raven, finch, hawk, eagly = %w(raven finch hawk eagle)

p hawk

# using the * operator to extract items directly from an array without using their indices

raven, finch, *raptors = %w(raven finch hark eagle)
p raven
p finch
p raptors

def method(array)
  
  yield(arra)
end

=begin
suppose we want to organize our array contents into groups
where varibales represent category names.
Can we do that without extracting items directly from teh array based on their indices?

We can use the splat operator to do something like this.

(*)












=end
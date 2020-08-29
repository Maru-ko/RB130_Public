=begin
Method to Proc




comparator = proc { |a, b| b <=> a }

array = [12, 45, 15,9, 78, 60, 15, 5]


p array.sort(&comparator)
=end

def convert_to_base_8(n)
  n.to_s(8).to_i #repace these two method calls
end


base8_proc = method(:convert_to_base_8).to_proc

p [8, 10, 12, 14, 16, 33].map(&base8_proc)

#=> [10, 12, 14, 16, 20, 41]


=begin

After looking at that documentation, we see that a symbol of an existing method may be passed into `method(sym)`.
If we do that the functionality of that method gets wrapped `Method` object, and we may now work on that object.

base8_proc = method(:convert_to_base_8).to_proc

Remembering that using just `&` (and not `&:`) lets us turn a `Proc` object to a block.







=end
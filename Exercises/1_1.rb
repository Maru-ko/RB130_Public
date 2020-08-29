=begin
Enumberable Class Creation


=end

class Tree
  include Enumerable

  def each
    #...
  end
end

=begin
To provide most of the functionality of the `Enumerable` module, all we need is to include `Enumerable` if our class, and define an `each` method
that yields each member of the collection, one at a time.










=end
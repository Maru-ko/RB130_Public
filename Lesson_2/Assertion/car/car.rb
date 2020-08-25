class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other)
    other.instance_of?(self.class) && name == other.name
  end
end
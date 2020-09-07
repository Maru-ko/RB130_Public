class School
  attr_accessor :school
  def initialize
    @school = Hash.new
  end

  def to_h
    school.map { |grade, value| [grade, value.sort]}.sort.to_h
  end

  def add(name, grade)
    school[grade] ? school[grade] << name : school[grade] = [name]
  end

  def grade(grade)
    school[grade] || []
  end
end


# Lecture: Classes and Objects

# As you know by now, classes are the blueprints for objects. Below are some practice problems that test your knowledge of the connection between classes and objects

# 1. Given the below usage of the Person class, code the class definition.

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def compare_names(other_name)
    self.name == other_name.name
  end

  def to_s
    name
  end

  private

  def parse_full_name(full_name)
    names = full_name.split
    self.first_name = names.first
    self.last_name = names.size > 1 ? names.last : ''
  end
end

bob = Person.new("Robert")
puts bob.name             # 'bob'
puts bob.first_name       # 'Robert'
puts bob.last_name        # ''
puts bob.last_name = 'Smith'
puts bob.name             # 'Robert Smith'
bob.name = "John Adams"
puts bob.first_name
puts bob.last_name
bob = Person.new("Robert Smith")
rob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
puts bob.to_s
puts bob.compare_names(rob)
puts bob.name == rob.name
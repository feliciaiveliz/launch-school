# Reading and Writing

# Add the appropriate accessor methods to the following code.

class Person
  attr_writer :name
  attr_reader :name
end

# or

Person = Struct.new(:name)

person1 = Person.new
person1.name = "Jessica"
puts person1.name

# Choose the Right Method

# Add the appropriate accessor methods to the following code.

class Person
  attr_accessor :name
  attr_writer :phone_number
end

person1 = Person.new
person1.name = "Jessica"
person1.phone_number = "0123456789"
puts person1.name


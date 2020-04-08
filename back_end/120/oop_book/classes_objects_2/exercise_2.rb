class Person

  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
end

bob = Person.new("Steve")
bob.name = "Bob"
puts bob.name
# We are trying to change the name bob but have no created the method to do so. 
# attr_reader only gives us the getter method and not the setter method, which is needed to make a change to an instance variable

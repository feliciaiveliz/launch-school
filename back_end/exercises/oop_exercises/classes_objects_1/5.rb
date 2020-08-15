# Hello, Sophie! (Part 1)

# Using the code from the previous exercise, add a parameter to #initialize that provides a name for the Cat object. Use an instance variable to print a greeting with the 

class Cat
  def initialize(name)
    @name = name
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new("Sophie")

# Instance variables are variables that exist within an object instance.
# They are available to reference only once the object has been initialized.
# To accepts arguments upon initialization, we need to add parameters to '#initialize'
# The instance variable is now available to reference anywhere inside the object
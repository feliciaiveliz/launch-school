# Hello, Sophie! (Part 2)

# Using the code from the previous exercise, move the greeting from the #initialize method to an instance method named #greet that prints a greeting when invoked.

class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new("Sophie")
kitty.greet

# Instance methods are written the same as any other method, except they're only available when there's an instance of the class.
# The instance variable @name can be accessed anywhere in the object. 
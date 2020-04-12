# Hello Chloe!

# Using the following code, add an instance method named #rename that renames kitty when invoked.

class Cat
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end

  def rename(new_name)
    self.name = new_name
  end
end

kitty = Cat.new("Sophie")
puts kitty.name  # Sophie
kitty.rename("Chloe")
puts kitty.name  # Chloe

# To modify the value using a setter method, we need to add additional syntax. 
# To invoke a setter method, we need to use 'self'
# We do this so that ruby knows the difference between initializing a local variable and invoking a setter method.

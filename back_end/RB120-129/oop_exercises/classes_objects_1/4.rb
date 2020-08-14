# What are you? 

# Using the code from the previous exercise, add an #initialize method that prints I'm a cat! when a new Cat object is initialized.

class Cat
  def initialize
    puts "I'm a cat!"
  end
end

kitty = Cat.new

# When defining a class, you usually need to define the 'intialize' method. 
# #initialize is useful for setting up (or initializing) an object so the object is ready for immediate use.
# Adding this method lets us execute certain statements when a new 'Cat' object is initialized.
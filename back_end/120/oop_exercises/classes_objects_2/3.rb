# Identify Yourself (Part 1)

# Using the following code, add a method named #identify that returns its calling object.

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end
end
# We used 'self' to define class methods and to modify instance variables. 'self' is used because it refers to the calling object. 
# 'self' is the same as invoking 'kitty'.

kitty = Cat.new("Sophie")
p kitty.identify # => #<Cat:0x007f932b06dba8 @name="Sophie">
p kitty          # => #<Cat:0x007f932b06dba8 @name="Sophie">
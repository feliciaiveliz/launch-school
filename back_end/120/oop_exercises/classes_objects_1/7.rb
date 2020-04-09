# Reader

# Using the code from the previous exercise, add a getter method named #name and invoke it in place of @name in #greet.

class Cat

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!" # this invokes the #name getter method
  end
end

kitty = Cat.new("Sophie")
kitty.greet # Hello! My name is Sophie!
puts kitty.name # Sophie

# A getter method not only lets us invoke the #name method inside the class, but also outside the class via the object
# 1. puts "Hello! My name is #{name}!" (inside the class)
# 2. kitty.name (outside the class via the object)

# Getter methods can be written manually or using shorthand:

class Cat
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

# or

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end
end
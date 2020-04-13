# Identify Yourself (Part 2)

# Update the following code so that it prints I'm Sophie! when it invokes puts kitty.

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
    puts "I'm #{self.name}!"
  end
end

kitty = Cat.new("Sophie")
puts kitty

# Launc School

class Cat
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new("Sophie")
puts kitty
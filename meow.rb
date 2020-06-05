class Bird
  attr_reader :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end

  def to_s
    "I'm #{name} and I have #{color} feathers!"
  end
end

bird = Bird.new("Bubbles", 'red')
puts bird

def bar=(val)
  @bar = val - 20
  # sets value of ivar @bar to (value - 20)


  # Without running the code, go step by step through what happens for each line
# 23-27 and any returns. Which if any of the methods in the class do not have to
# be public?

class CrazyAccessors
  def bar
    @bar
    # getter method for @bar
  end

  def baz=(value)
    self.bar = value
    # this is calling setter method 'bar='
  end

  def quux=(value)
    @bar = value
    # sets value of ivar @bar to value
  end
  
  private 
  
  def bar=(val)
    @bar = val - 20
    # sets value of ivar @bar to (value - 20)
  end
end

obj  = CrazyAccessors.new
obj.baz = 50 # outside of class, public
puts obj.bar # public
obj.quux = 50 # public
puts obj.bar # public

# Debug the following code to get the indicated returns:

class Dog  
  def initialize(name, age)
    @name = name
    @age = age
  end

  def older?(other)
    age > other.age
  end
  
  protected
  
  attr_reader :age
end

everest = Dog.new('Everest', 1)
sadie = Dog.new('Sadie', 10)

puts sadie.older?(everest) # true

puts sadie.age # NoMethodError

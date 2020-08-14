# 1. Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?

# 1. true
# 2. "hello"
# 3. [1, 2, 3, 'happy days']
# 4. 142

# 1, 2, 3, and 4 are all objects of different classes. They are the TrueClas, String, Array and Integer classes.
# You can find out the class by using the #class method on the object.

# 2. If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast using the module Speed? How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

car = Car.new
truck = Truck.new
puts car.go_fast
puts truck.go_fast

# Use the 'include' method invocation to mixin the module to the classes that need it, and then invoke the method within the module on the objects of the classes to use them.

# 3. When we called the go_fast method from an instance of the Car class (as shown below) you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. How is this done?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

small_car = Car.new
puts small_car.go_fast # => I am a Car and going super fast!

# This is done because we call 'self'.class and interpolate it. 'self' refers to the object that called the method and '.class' returns the class that the object belongs to.

# 4. If we have a class AngryCat how do we create a new instance of this class?

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

bad_cat = AngryCat.new
puts bad_cat.hiss

# To define an instance of a class, you need to chain the '.new' class method on the class that you want to create the object from

# 5. Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

pizza = Pizza.new("cheese")
apple = Fruit.new("apple")

puts pizza.instance_variables # => [:@name]
puts apple.instance_variables # => []
# Use #instance_variables to check to see if a class contains instance variables or not
# The 'Pizza' class has an instance variable because these start with a '@'. 
# 'Fruit' class contains a local variable.

# 6. What could we add to the class below to access the instance variable @volume?

class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end
end

cube = Cube.new(20)
puts cube.volume

# We could use a getter method either with attr_accessor or attr_reader, pass in the key :volume

# 7. What is the default return value of to_s when invoked on an object? Where could you go to find out if you want to be sure?
# It returns the name of the object's class and an encoding of the object id. We can use Ruby Docs to make sure.

# 8. You can see in the make_one_year_older method we have used self. What does self refer to here?

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# 'self' within an instance method refers to the calling object, in this case it would be an object of the Cat class. 

# 9. In the name of the cats_count method we have used self. What does self refer to in this context?

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# 'self' when prepended to a method definition refers to the class itself. 
# We use this to call on 'Cat' class to return the value held by the @@cats_count class variable.

# 10. If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# You need to call #new on the Bag Class and pass in two arguments. You can either save this to a variable or call other methods directly on the return value.
# Bag.new('black', 'leather')
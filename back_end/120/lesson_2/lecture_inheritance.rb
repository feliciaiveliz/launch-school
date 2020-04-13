# Lecture Inheritance

# Class based inheritance works great when it's used to model hierarchical domains. Let's take a look at a few practice problems. Suppose we're building a software system for a pet hotel business, so our classes deal with pets.

# 1. Given this class: Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

  def fetch
    'fetching!'
  end
end

class BullDog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < BullDog
  def fetch 
    "I don't play fetch, but I still play!"
  end
end

teddy = Dog.new
puts teddy.speak
puts teddy.swim

winston = BullDog.new
puts winston.speak
puts winston.swim

# 2. Let's create a few more methods for our Dog class. Create a new class called Cat, which can do everything a dog can, except swim or fetch. Assume the methods do the exact same thing. Hint: don't just copy and paste all methods in Dog into Cat; try to come up with some class hierarchy.

paws = Cat.new
puts paws.fetch
puts paws.swim

#####################333

# Launch School Solution

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end

  def swim
    'swimming!'
  end
end

class BullDog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

mittens = Pet.new
paws = Cat.new
bubbles = Dog.new
winston = BullDog.new

puts mittens.run
puts mittens.speak

puts paws.speak
puts paws.run
puts paws.fetch

puts bubbles.speak

puts winston.swim
puts winston.run

# 3. Draw a class hierarchy diagram of the classes from step #2

# Classes: Pet, Dog, Cat, BullDog
# Object > Pet (run, jump) > Dog (speak, fetch, swim)> BullDog (swim)
# Object > Pet (run, jump) > Cat (speak)

# 4. What is the method lookup path and how is it important?

# A distinct path ruby uses everytime a method is called. This is the order in which classes are inspected when a method is called.
# By understanding the method lookup path, we can have a better idea of where and how all avaialble methods are organized.
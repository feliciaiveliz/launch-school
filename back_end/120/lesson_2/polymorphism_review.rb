class Animal
  def eat
    puts "I'm an animal that can eat!"
  end
end

class Fish < Animal
  def eat
    puts "I'm a fish that can eat!"
  end
end

class Cat < Animal
  def eat
     puts "I'm a cat that can eat!"
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Cat.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end

# Every object in the array is a different animal but the client code can treat them all as a generic animal, or an object that can eat.
# The public interface lets us work with these types in the same way even though the implementation is different.
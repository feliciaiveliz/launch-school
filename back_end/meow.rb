class Animal
  def speak
    "hello"
  end
end

class Dog < Animal
  def speak
    "bark"
  end
end

class Cat < Animal
  def speak
    "meow"
  end
end

def greet_animal(animal)
  animal.speak
end

array_of_animals = [Animal.new, Dog.new, Cat.new]

array_of_animals.each do |animal|
  p animal.speak
end
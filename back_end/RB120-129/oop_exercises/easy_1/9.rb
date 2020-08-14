# Complete the Program - Cats!

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, fur_color)
    super(name, age)
    @fur_color = fur_color
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@fur_color} fur."
  end
end

class Chicken < Pet
  def to_s
    "My chicken #{@name} is #{@age} years old."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch
pepe = Chicken.new("Pepe", 3)
puts pepe
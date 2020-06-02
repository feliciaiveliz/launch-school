class Zoo  
  @@total_animals = 0
  attr_reader :animals, :name
  
  def initialize
    @animals = []
    @@total_animals = @animals
  end
  
  def <<(animal)
    animals.push(animal)
  end
  
  def total_animals
    @@total_animals.size
  end
  
  def self.total_animals
    @@total_animals.size
  end
end

class Animal
  attr_reader :name
  
  def initialize(name, type)
    @name = name
    @type = type
  end
  
  def ==(other)
    name == other.name
  end
end

sa_zoo = Zoo.new
ellie = Animal.new("Ellie", "elephant")
fluffy = Animal.new("Ellie", "bear")
sa_zoo << ellie << fluffy

p sa_zoo.total_animals
p Zoo.total_animals

class House
  def self.info
    "#{self}"
  end
  
  def lovelyvilla
    "#{self.name}"
  end
end

class Cottage < House
  attr_accessor :name
  
  def initialize(n)
    self.name = n
  end
  
  def info
    "I am #{name}"
  end
  
  def rent
    "I can be rented"
  end
end

class Lakeside < Cottage
  def describe
    "Location: #{self.class.info}; Name: #{lovelyvilla}."
  end
end

lovelyvilla = Lakeside.new('Lovely Villa')

p lovelyvilla.describe

# "Location: Lakeside; Name: Lovely Villa"

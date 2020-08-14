# class Cat
#   attr_reader :name

#   @@total_cats = 0

#   def initialize(name)
#     @name = name
#     @@total_cats += 1
#   end

#   def jump
#     "#{self.name} is jumping!"
#   end

#   def self.total_cats
#     @@total_cats
#   end

#   def to_s
#     @name
#   end
# end

# mitzi = Cat.new('Mitzi')
# puts mitzi.jump # => "Mitzi is jumping!"
# puts Cat.total_cats # => 1
# puts "The cat's name is #{mitzi}" # => "The cat's name is Mitzi"

# class Student
#   def initialize(name)
#     @name = name
#     @grade = nil
#   end
# end

# ade = Student.new('Adewale')
# p ade

# class Student
#   attr_accessor :name, :grade

#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end
# end

# jon = Student.new('John', 22)
# puts jon.name # => 'John'
# jon.name = 'Jon'
# jon.grade = 'B'
# puts jon.grade # => 'B'

# class Character
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{name} is speaking."
#   end
# end

# class Knight < Character
#   def name
#     "Sir " + super
#   end
# end

# class Thief < Character
#   def speak
#     "#{name} is whispering..."
#   end
# end


# sneak = Thief.new("Sneak")
# puts sneak.name # => "Sneak"
# puts sneak.speak # => "Sneak is whispering..."

# # sir_gallant = Knight.new("Gallant")
# # puts sir_gallant.name # => "Sir Gallant"
# # puts sir_gallant.speak # => "Sir Gallant is speaking."

class FarmAnimal
  def speak
    "#{self.class} says "
  end
end

class Sheep < FarmAnimal
  def speak
    super + "baa!"
  end
end

class Lamb < Sheep
  def speak
    super + "baaaaaaa!"
  end
end

class Cow < FarmAnimal
  def speak
    super + "mooooooo!"
  end
end

puts Sheep.new.speak # => "Sheep says baa!"
puts Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
puts Cow.new.speak # => "Cow says mooooooo!"


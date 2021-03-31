# The code below raises an exception. Examine the error message and alter the code so that it runs without error.

module Flyable
  def move
    "I'm flying!"
  end
end

class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
  include Flyable
end

class FlightlessBird < Bird
  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
owl = Bird.new(:carnivore, 'night hunter')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

puts unicornfish.move
puts penguin.move
puts robin.move
puts owl.move

# Initialize is not necessary in FlightlessBird because all necessary arguments were passed in. It does not do anything different upon iniitialization.
# Ruby will call #initialize when it goes up the method chain, since it is the same exact method.
# 
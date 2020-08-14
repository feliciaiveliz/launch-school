# Given the class below, if we created a new instance of the class and then called to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"

class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def display_Type
    "I am a #{type} cat"
  end
end

# How could we go about changing the to_s output on this method to look like this: I am a tabby cat? (this is assuming that "tabby" is the type we passed in during initialization).

cat = Cat.new("tabby")
puts cat
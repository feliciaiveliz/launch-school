# Generic Greeting (Part 1)

# Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.

# class Cat
#   def self.generic_greeting
#     puts "Hello! I'm a cat!"
#   end
# end

# Cat.generic_greeting

#generic_greeting is a class method. Class methods are defined by prepending the method name with self.

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

kitty = Cat.new
kitty.class.generic_greeting 

# The return value of calling #class on the 'kitty' object is 'Cat'. 
# Using that return value of the class name, we can invoke 'generic_greeting' on 'Cat' to output the right result.

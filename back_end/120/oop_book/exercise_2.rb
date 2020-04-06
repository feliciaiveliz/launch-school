# 2. What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

=begin

A module is a collection of behaviors that can be made available to classes using the 'include' method invocation. It's used as another way to achieve polymorphism in Ruby. 
Multiple classes can have access to the behaviors in a module via a 'mixin'. Modules allow us to group usable code into one place. 
=end

module Speak
end

class GoodCat
  include Speak
end

whiskers = GoodCat.new

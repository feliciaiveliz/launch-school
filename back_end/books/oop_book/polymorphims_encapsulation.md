\# Polymorphism



\## Polymorphism refers to the ability of different objects to respond in different ways to the same message (or method invocation)



\# Polymorphism through inheritance



This code implements polymorphism through inheritance:



\```ruby

class Animal

 def eat

  *# generic eat method*

 end

end



class Fish *< Animal*

 def eat

  *# eating specific to fish*

 end

end



class Cat *< Animal* 

 def eat

  *# eat implementation for cat*

 end

end



def feed_animal(animal)

 animal.eat

end



array_of_animals = [*Animal*.new, *Fish*.new, *Cat*.new]

array_of_animals.each do |animal|

 feed_animal(animal)

end

\```



Every object in the array is a differnt animal but the client code can treat them all as a generic animal, i.e., an object that can eat. The public interface lets us work with all of these types in the same way even though the implementations can be very differnt. This is **polymorphism**.



\### Polymorphism through duck typing



Duck typing in Ruby doesn't concern itself with the class of the object; instead it is concerned with what methods are available on the object. If an object 'quacks' like a duck, then we can treat it like a duck.



Here, we define a `wedding` class that attempts to implements
# Polymorphism

## Polymorphism refers to the ability of different objects to respond in different ways to the same message (or method invocation)

# Polymorphism through inheritance

This code implements polymorphism through inheritance:

```ruby
class Animal
  def eat
    # generic eat method
  end
end

class Fish < Animal
  def eat
    # eating specific to fish
  end
end

class Cat < Animal 
  def eat
    # eat implementation for cat
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Cat.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end
```

Every object in the array is a differnt animal but the client code can treat them all as a generic animal, i.e., an object that can eat. The public interface lets us work with all of these types in the same way even though the implementations can be very differnt. This is *polymorphism*.

### Polymorphism through duck typing

Duck typing in Ruby doesn't concern itself with the class of the object; instead it is concerned with what methods are available on the object. If an object 'quacks' like a duck, then we can treat it like a duck.

Here, we define a `wedding` class that attempts to implement polymorphic behavior with using duck typing. This is how **not** to do it. 

```ruby
class Wedding
  attr_reader :guests, :flowers, :songs

  def prepare(preparers)
    preparers.each do |preparer|
      case preparer
      when Chef
        preparer.prepare_food(guests)
      when Decorator
        preparer.decorate_place(flowers)
      when Musician
        preparer.prepare_performance(songs)
      end
    end
  end
end

class Chef
  def prepare_food(guests)
    # implementation
  end
end

class Decorator
  def decorate_place(flowers)
    # implementation
  end
end

class Musician
  def prepare_performance(songs)
    #implementation
  end
end
```
The problem with this is that the `prepare` method has too many dependencies. It relies on specific classes and their names. It also needs to know which method it should call on each of the objects, as well as the argument that those methods require. If you change anything within those classes that impacts `Wedding#prepare`, you need to refactor the method. If we need to add another wedding preparer, we must add another `case` statement. Before long, the method will become too long and messy.

Let's refactor to implement polymorphism and duck typing:

```ruby
class Wedding
  attr_reader :guests, :flowers, :songs

  def prepare(preparers)
    preparers.each do |preparer|
      preparer.prepare_wedding(self)
    end
  end
end

class Chef
  def prepare_wedding(wedding)
    prepare_food(wedding.guests)
  end

  def prepare_food(guests)
    #implementation
  end
end

class Decorator
  def prepare_wedding(wedding)
    decorate_place(wedding.flowers)
  end

  def decorate_place(flowers)
    # implementation
  end
end

class Musician
  def prepare_wedding(wedding)
    prepare_performance(wedding.songs)
  end

  def prepare_performance(songs)
    #implementation
  end
end
```

There is no inheritance going on here but there is polymorphism. Each class much define a `prepare_wedding` method and implement it in its own way. If we need to add another preparer, we can create another class and just implement `prepare_wedding` to perform the appropriate actions. 

### Encapsulation

This lets us hide the internal representation of an object from the outside and only expose the methods and properties that users of the object need. We expose these properties and methods through the public interface of a class: its public methods.

```ruby
class Dog
  attr_reader :nickname

  def initialize(n)
    @nickname = n
  end

  def change_nickname(n)
    self.nickname = n
  end

  def greeting
    "#{nickname.capitalize} says Woof Woof!"
  end

  private
    attr_writer :nickname
end

dog = Dog.new("rex")
dog.change_nickname("barny") # changed nickname to "barny"
puts dog.greeting # Displays: Barny says Woof Woof!
```

We can change the nickname of a dog by calling the `change_nickname` method without needing to know how the `Dog` class and this method are implemented. The same thing happens when we call the method `greeting` on a `Dog` object. The output is `Barny says Woof Woof!"`. Again, we don't need to know how the method is implemented. The main point is that we can expect a greeting message from the dog.

The setter method for `nickname` is private: it is not available outside of the class and `dog.nickname = 'barny'` would raise an error. 
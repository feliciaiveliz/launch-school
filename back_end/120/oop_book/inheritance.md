# Inheritance

**Inheritance** is when a class inherits behavior from another class. The class that is inheriting the behavior is called the **subclass** and the class it inherits from is called the **superclass**. Inheritance is a way to extract common behaviors from classes that share that behavior and move it to a superclass.

### **Class Inheritance**

Here, we extract the `speak` method to a superclass `Animal` and we use inheritance to make that behavior available to `GoodDog` and `Cat` classes.

```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
end

class Cat < Animal
end

sparky = GoodDog.new
paws = Cat.new
puts sparky.speak           # => Hello!
puts paws.speak             # => Hello!
```

We use the `<` symbol to signify that the two classes are inheriting from the `Animal` class. This means that all of the methods in the `Animal` class are available to the other classes to use. What happens if we wanted to use the original `speak` method from the `GoodDog` class?

```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  attr_accessor :name

  def initialize(n)
    self.name = n
  end

  def speak
    "#{self.name} says arf!"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Sparky")
paws = Cat.new

puts sparky.speak           # => Sparky says arf!
puts paws.speak             # => Hello!
```

In the `GoodDog` class, we're overriding the `speak` method in the `Animal` class because Ruby checks in the object's class first for the method before it looks in the superclass. It uses *method lookup* path. It looks in the object's class for a method before it moves on to the superclass. 

### **super**

Ruby has a built-in method called `super` that allows us to call methods up the inheritance hierarchy. When you call `super` from within a method, it will search the inheritance hierarchy for a method by the same name then invoke it.

```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

sparky = GoodDog.new
sparky.speak        # => "Hello! from GoodDog class"
```

We've created an `Animal` class with a `speak` instance method. Then we create `GoodDog` which subclasses to `Animal` also with a `speak` instance method to override the inherited version. In the subclass' `speak` method, we use `super` to invoke the `speak` from the superclass `Animal`, and then we extend the functionality by appending some text to the result.

Another more common way of using `super` is with `initialize`. 

```ruby
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")        # =><GoodDog:0x007fb40b1e6718 @color="brown", @name="brown"
```

Extracting common methods to a superclass is great way to model concepts that are naturally hierarchical. The goal of DRY code is to put the right behavior in the right class so that we don't need to repeat code in multiple classes. We can imagine that all `Fish` objects are related to animals that live in water, so maybe a `swim` method should be in the `Fish` class. We can also have a class called `Mammal` with objects that have warm blood, so we can create a method called `warm_blooded?` and have it return `true`. Therefore, the `Cat` and `Dog` objects will have access to the `warm_blooded?` method which is automatically inherited from `Mammel` class but they won't have access to the methods in the `Fish` class. 

This type of hierarchical modeling works but there are exceptions. We want to put the `swim` method in the `Fish` class but some mammals can swim as well. We don't want to move `swim` into `Mammal` because it violates DRY. For these situations, its best to group them into a module an then *mix in* that module to the classes that require those behaviors. 

```ruby
module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable         # mixing in Swimmable module
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable         # mixing in Swimmable module
end
```

`Fish` and `Dog` objects can swim, but objects from other classes won't be able to. 

```ruby
sparky = Dog.new
neemo  = Fish.new
paws   = Cat.new

sparky.swim                 # => I'm swimming!
neemo.swim                  # => I'm swimming!
paws.swim                   # => NoMethodError: undefined method `swim' for #<Cat:0x007fc453152308>
```

Using modules to group common behaviors allows us to build more powerful, flexibles and DRY designs.

*It is common practice to apply the 'able' suffix to whatever verb we're using to describe the name of the module. Example: `Swimmable` and `Walkable`.

### Instance vs Modules

Class inheritance is the traditional way to think about inheritance: one type inherits the behaviors of another type. The result is a new type that specializes the type of the superclass. The other form is called **interface inheritance**.

- Interface inheritance: The class doesn't inherit from another type, but instead inherits the interface provided by the mixin module. The result is not a specialized type with respect to the module.

Things to consider when figuring out when to use class inheritance vs mixins.

- You can only subclass (class inheritance) from one class. You can mix in as many modules (interface inheritance) as you'd like.
- If there's an 'is-a' relationship, class inheritance is the better choice. If there's a 'has-a' relationship, interface inheritance is better. Example: a dog 'is an' animal and it 'has an' ability swim.
- You cannot instantiate modules (no objects can be created from a module). Modules are only used for namespacing and grouping common methods together.

### Method Lookup Path

MLP is the order in which classes are inspected when you call a method.

```ruby
module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end
```

We have three modules and one class. We mixed in one module into the `Animal` class. The mlp is the path Ruby takes a look for a method. We can see the path using `ancestors` class method.

```ruby
puts "---Animal method lookup---"
puts Animal.ancestors
```

The output looks like this:

```ruby
---Animal method lookup---
Animal
Walkable
Object
Kernel
BasicObject
```

When we call a method on any `Animal` object, first Ruby looks in the `Animal` class, then the `Walkable` module, then the `Object` class, then the `Kernel` module and finally the `BasicObject` class. 

```ruby
fido = Animal.new
fido.speak # => I'm an animal, and I speak!
```

Ruby found the `speak` method in the `Animal` class and stopped looking.

```ruby
fido.walk => I'm walking!
```

It found the `walk` instance method in the `Walkable` module and stopped looking.

```ruby
fido.swim =>   # => NoMethodError: undefined method `swim' for #<Animal:0x007f92832625b0>
```

Ruby looked in all classes and modules in the list and couldn't find a `swim` method, so it threw an error. 

```ruby
class GoodDog < Animal
  include Swimmable
  include Climbable
end

puts "---GoodDog method lookup---"
puts GoodDog.ancestors
```

Output: 

```ruby
---GoodDog method lookup---
GoodDog
Climbable
Swimmable
Animal
Walkable
Object
Kernel
BasicObject
```

###  More Modules

Another use for **namespacing: It means organizing similar classes under a module. Use modules to group related classes. Using them makes it easier for us to recognize related classes in our code. It also reduces the likelihood of our classes colliding with other similarly named classes in our codebase. 

```ruby
module Mammal 
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end
    
  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end
```

We call classes in a module by appending the class name to the module name with two colons( `::`)

```ruby
buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speak("Woof!") => "Woof!"
kitty.say_name("kitty") => "kitty"
```

The second use case for modules is using them as a **container** for methods, called **module methods**. This involves using modules to house other methods. This is useful for methods that seem out of place within code. 

```ruby
module Mammal
  ...
  
  def self.some_out_of_place_method(num)
    num ** 2
  end
end
```

Defining methods this way within a module means we can call them directly from the module:

```ruby
value = Mammal.some_out_of_place_method(4)
```

We call also call methods by doing:

```ruby
value = Mammal::some_out_of_place_method(4)
```

*Although the former is preferred.

### Private, Protected and Public

Right now, all the methods in our `GoodDog` class are public methods. 

- **Public Methods**: methods that are available to anyone who knows either the class name or object's name. These methods are available for the rest of the program to use and comprise the class's *interface* (that's how the other classes and objects will interact with this class and its objects).

Sometimes you'll have methods that are doing work in the class but don't need to be available for the rest of the program. **These are private methods**. How are they defined? We use the `private` method call in our program and anything below it is private (unless another method, like `protected` is called after it to negate it).

In our `GoodDog` class we have one operation that takes place that we could move into a private method. When we initialize an object, we calculate the dog's in dog years. We can refactor this logic into a method and make it private so nothing outside of the class can use it.

```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
sparky.human_years
```

```ruby
NoMethodError: private method `human_years' called for
  #<GoodDog:0x007f8f431441f8 @name="Sparky", @age=4>
```

We've made the `human_years` method private by placing it under the `private` method call. Why do this if it can't be used? `private` methods are only accessible from other methods in the class:

```ruby
# assume the method definition below is above the "private" keyword

def public_disclosure
  "#{self.name} in human years is #{human_years}"
end
```

Here, we cannot use `human_years` because it is a `private` method. Remember that `self.human_years` is equivalent to `sparky.human_years`, which is not allowed for private methods. In summary, private methods are not accessible outside of the class definition at all, and are only accessible from inside the class when called without `self`. 

Sometimes we want an in-between approach. We can use the`protected` keyword to create **protected** methods. 

1. from inside the class, `protected` methods are accessible just like `public` methods
2. from outside the class, `protected` methods act just like `private` methods. 

```ruby
class Animal 
  def a_public_method
    "Will this work? " + self.a_protected_method
  end
    
  protected
    
  def a_protected_method
    "Yes, I'm protected!"
  end
end
```

We've created an `Animal` object to test it out:

```ruby
fido = Animal.new
fido.a_public_method        # => Will this work? Yes, I'm protected!
```

We can call a `protected` method from within the class, even with `self` prepended. What about outside of the class?

```ruby
fido.a_protected_method
  # => NoMethodError: protected method `a_protected_method' called for
    #<Animal:0x007fb174157110>
```

We can't call protected methods from outside of the class. 

### Accidental Method Overriding

Every class you create inherently subclasses from class `Object`. The `Object` class is built into Ruby and comes with many methods. 

```ruby
class Parent
  def say_hi
    p "Hi from Parent."
  end
end

Parent.superclass       # => Object
```

Through inheritance, a subclass can override a superclass's method:

```ruby
class Child < Parent
  def say_hi
    p "Hi from Child."
  end
end

child = Child.new
child.say_hi         # => "Hi from Child."
```

If you accidently override a method that was originally defined in the `Object` class, it can have negative effects on code. Example: `send` is an instance method that all classes inherit from `Object`. If you defined a new `send` instance method in your class, all objects of your class will call the custom `send` method instead of the one in class `Object`, which is probably the one they mean to call. Object `send` serves as a way to call a method by passing it a symbol or a string which represents the method you want to call. 

```ruby
son = Child.new
son.send :say_hi => "Hi from Child"
```

What happens if we define a `send` method in our `Child` class and then try to invoke `Object`'s `send` method:

```ruby
class Child
  def say_hi
    p "Hi from Child."
  end
    
  def send
    p "send from Child..."
  end
end

lad = Child.new
lad.send :say_hi 
```

Our overridden `send` method does not take any arguments. What does `instance_of?` method do? It returns `true` if an object is an instance of a given class and `false` otherwise. 

```ruby
c = Child.new
c.instance_of? Child => true
c.instance_of? Parent => false
```

```ruby
class Child
  # other methods omitted

  def instance_of?
    p "I am a fake instance"
  end
end

heir = Child.new
heir.instance_of? Child
```

We try to override `instance_of?` within `Child`. We wanted to use Object's `instance_of?` method:

```ruby
ArgumentError: wrong number of arguments (1 for 0)
from (pry):22:in `instance_of?'
```

Familiarize with Object's methods to make sure to not accidentally override them as this can have devastating consequences for your application.


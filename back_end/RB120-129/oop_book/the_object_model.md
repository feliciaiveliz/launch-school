## Object Oriented Programming Book

### The Object Model

OOP was created to deal with the growing complexity of large software systems. These systems become difficult to maintain as they grow. OOP allows for programmers to section off areas of code that perform certain procedures so that their programs could become the interaction of small parts, instead of one giant program of dependency.

Terms:

- **Encapsulation**: Hiding pieces of functionality and making it unavailable to the rest of the code base. This is a form of data protection. The data cannot be manipulated or changed without obvious intention. It is what defines the boundaries in an application. Ruby does this by creating objects and exposing interfaces (methods) to interact with those objects.
- **Polymorphism**: The ability of data to be represented as many different types. "Poly" means "many" and "morph" means "forms". We can use pre-written code for new purposes.
- **Inheritance**: Used in Ruby where a class inherits the behavior of another class, referred to as the **superclass**. This gives programmers the ability to define basic classes with large reusability and smaller **subclasses** for more fine-grained and detailed behaviors.
- **Modules**: Similar to classes in that they contain shared behavior, however you cannot create an object with a module. A module must be mixed in with a class using the `include` method invocation.
- **Mixin**: When a module is mixed in with a class using the `include` method invocation. After mixing in a module, the behaviors declared in that module are available to the class and its objects.

### What are Objects?

Objects are created from classes. Classes can be thought of as 'molds' and objects and the things produced from the molds. Individual objects will contain information from other objects, but are **instances** of the same class.

```ruby
"hello".class 
=> String
"world".class
=> String
```

We used the `class` instance method to determine the class of each object. 

### Classes Define Objects

Ruby defines the attributes and behaviors of its objects in **classes**. It can be thought of this way: 

> Classes are basic outlines of what an object should be made of and what it should be able to do. 

To define a class: replace `def` with `class` and use CamelCase to create the name. Then used reserved word `end` to finish the definition. Ruby files names should be in snake_case and reflect the class name. 

```ruby
class GoodDog
end

sparky = GoodDog.new
```

We have created an instance of our `GoodDog` class and stored it in the variable `sparky`. This is now an object. We say that `sparky` is an object or instance of class `GoodDog`. Here, an object is returned by calling the class method `new`.

- **Instantiation**: The entire workflow of creating a new object or instance from a class. Or we could say: we have instantiated an object called `sparky` from the class `GoodDog`. 

### Modules

Modules are another way to achieve polymorphism in Ruby. A **module** is a collection of behaviors that are usable in other classes via **mixins**. A module is "mixed in" to a class using the `include` method invocation. 

```ruby
module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arf!") # => Arf!
bob = HumanBeing.new 
bob.speak("Hello!") # => Hello!
```

Both the `GoodDog` object and the `HumanBeing` object have access to the `speak` instance method. This is possible through 'mixing in' the module `Speak`. 

Summarize: 

> The module `Speak` is a collection of behaviors that are available to other classes, in this case, classes `GoodDog` and `HumanBeing`. Both classes have access to the `Speak` instance method because the `Speak` module was 'mixed in' to both classes. We created two objects `sparky` and `bob`, which are instances of their respective classes. 



### Method Lookup

Ruby has a distinct lookup path that it follows every time a method is called. Use the `ancestors` method on any class to find out the method lookup chain.

```ruby
module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

puts "---GoodDog ancestors---"
puts GoodDog.ancestors
puts ''
puts "---HumanBeing---"
puts HumanBeing.ancestors
```

The output:

```ruby
---GoodDog ancestors---
GoodDog
Speak
Object
Kernel
BasicObject

---HumanBeing ancestors---
HumanBeing
Speak
Object
Kernel
BasicObject
```

Since the `speak` method is not defined in the `GoodDog` class, it looks then at the `Speak` module. This continues in a linear orderly fashion until the method is found or until there are no more places to look.


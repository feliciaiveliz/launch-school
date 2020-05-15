# Summary of OOP

#### **Question: Why is OOP important?**

- Programmers can think more abstractly about the code they are writing as they create objects, classes, etc

- It's easier to conceptualize objects because they can be represented by real-world nouns and names

- You have control over which methods are available to a program and how much access it has to these methods

- It helps us to avoid duplication of code by giving us the ability to expose functionality to different parts of a program

- It allows us to better manage with larger programs as they grow in complexity. Since these programs are the interaction of smaller parts, they can be sectioned off and worked on as opposed to having to manage one larger program of dependency

- Some code is already pre-written so we can build programs faster

  

#### Describe Polymorphism

This is the ability of different objects to respond in different ways to the same methods. This can be achieved through class inheritance or duck typing.

Polymorphism through inheritance:

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

The array contains different animal objects, but the client code treats them all as generic animals; animals that can eat. The public interface lets us work with these objects in the same way even though their implementations are different.

Polymorphism through duck typing:

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



***

#### **Describe encapsulation and give an example.**

Encapsulation is the hiding or restricting access to pieces of functionality in a program. It's hiding the internal representation of an object from the outside and only exposing the methods and properties that users of the object need. This is data protection. This is achieved through the use of private, protected and public methods. 

> **Public methods** are readily available for use in the program by anyone who knows the class's or objects name. These comprise the class's interface. All methods by default in Ruby are public, except the *initialize* method.

> **Private methods** are not available to the rest of a program. Within the class, private methods can be called on 'self', or the object that called it, but cannot be used by other objects of a class. This goes for getter and setters methods.

> **Protected methods** work like private methods in the fact that they are not available to use outside of the class. Where they differ is with use *within* the class: they act like public methods by being accessible to other *objects* of the class. These rules apply in the context of *inheritance*.

***

### Classes and Objects

Classes are used to created objects. Classes are basic outlines of what objects are made of and what they should be able to do.  Objects can be instantiated from classes using the `new` method invocation. There are two main things to focus on when defining a class and its objects: `state` and `behavior`.  Within a class is where we define states and behaviors of an object. States track attributes for an object; they describe the object and they are how we tie data to objects. Behaviors are what the object is capable of doing. 

**Instance variables** are used to track an objects attributes (states). Instance variables start with `@` and are scoped at the object level. An instance variable is accessible as long as the object is available.

**instance methods** define an object's behavior. All objects of the same class can share behaviors (instance methods) while each have their own unique attributes. 

#### Initialize

The `initialize` method is a constructor method in Ruby. It gets booted up every time we instantiate an object from a class. To pass information to the `initialize` method, we use the `new` method invocation at instantiation. 

```ruby
class Cat
  def initialize(name)
    @name = name
  end
end

cat1 = Cat.new('Gian') # 'Gian' is passed to the `new` method invocation, which then is assigned to the `name` local variable parameter in the `initialize` method. The value referenced by the local variable is then assigned to the `instance` method `@name`.
```



#### Instance Methods

These are used to expose behaviors of objects of a class. If we had a `Cat` class, then we could have a few instance methods such as `speak`, `play`, `purr`, etc. These methods can be used by all instances of the `Cat` class as all cats share this behavior. Instance methods are defined using `def` and the method name.

```ruby
class Cat
  def initialize(name)
    @name = name
  end
    
  def speak
    puts "Meow!"
  end
end

cat1 = Cat.new("Gian")
cat1.speak # "Meow!"
```



#### Accessor Methods

The `attr_accessor` method takes symbols as parameters and creates the names for getter and setter methods. 

- A **getter method** is one that exposes information about the state of an object; it does this by returning the value of the instance variable given to us by the setter method. Within an instance method, we can call a getter method with just the method name instead of referencing the instance variable directly. 

- **Setter methods** change an object's state.  Within an instance method, we need to use `self` to refer to the setter method to change an object's state, otherwise Ruby would think that our intention was to call a local variable. 

  > What do getter methods look like and what do they give us?: This gives us the ability to call the method outside of the class with '(object name).name'. This exposes the **value of the instance variable**.
  >
  > ```ruby
  > attr_reader :name
  > 
  > cat1.name # BooBoo
  > ```
  >
  > What do setter methods give us?: These allow us to change the state of an object. Use `self` within an instance method to do this. 
  >
  > ```ruby
  > attr_writer :name
  > 
  > cat1.name = "Gian"
  > ```

```ruby
class Cat
  attr_accessor :name, :toy # this gives us getter/setter methods and an instance variable for each variable
    
  def initialize(name, toy)
    @name = name
    @toy = toy
  end
    
  def speak
    puts "Meow!"
  end
    
  
  def info
    puts "My name is #{name} and I play with #{toy}!" # instead of using instance variables here, we use the getter method to expose the information of the instance variable
  end
end

cat1 = Cat.new("Gian")
cat1.speak # Meow!
cat1.info # My name is Gian and I play with lazers!

cat1.name = "Kaathe"
cat1.toy = "string"

cat1.speak # Meow!
cat1.info # My name is Kaathe and I play with string!
```

***

### Class Methods

Class methods are only concerned with the class itself, not with instances of a class. To define a class method, prepend `self` to the method name. Objects contain state, and if we have a method that does not deal with states, than we can use a class method.

```ruby
class Cat
  def self.what_am_i
    puts "I'm a cat class!"
  end
end

Cat.what_am_i # I'm a cat class!
```

***

#### Class Variables

These variables start with two `@@` symbols and are instantiated at the *class* level. These capture information that deals with the class itself. 

```ruby
class Cat
  @@number_of_meows = 0 # class variable initialized to 0
  
  def initialize # constructor
    @@number_of_meows += 1 # called everytime an object is created
  end
    
  def self.total_number_of_meows # class method
    @@number_of_meows
  end
end

cat1 = Cat.new
cat2 = Cat.new

Cat.total_number_of_meows # 2
```

***

#### Constants

These variables are written in all capital letters. These have *lexical* scope, meaning that their scope depends on where they are in the program. These are never meant to be changed. Ruby allows you to change them, however it will throw an error. 

```ruby
class Cat
  CAT_YEARS = 7
  
  attr_accessor :name, :age
  
  def initialize(name, age)
    self.name = name
    self.age = age * CAT_YEARS
  end
end

cat1 = Cat.new("Gian", 3)
puts cat1.name # Gian
puts cat1.age # 21
```

***

#### Self

Two use cases for `self`:

1. Use `self` when referring to setter methods within an instance method. This way Ruby knows we intend to use the setter method to change a state of an object, as opposed to creating local variables.
   - Within an instance method, `self` refers to the *calling object*, or an object of the class.
   - `self.name=` is the same as `cat1.name=` (calling outside of the class)

2. `self` outside of an instance method but inside of a class refers to the *class* itself.

   - When prepended to a method name, this becomes a *class* method. These are called on the class itself and is not concerned with objects of the class. 

   - `def self.what_am_i` is the same as `Cat.what_am_i`

     

***

## Inheritance

Inheritance is when a class inherits the behavior of another class. A class can only subclass from one other class. The class that inherits from another class is called a subclass and the class it inherits from is called the superclass. Inheritance is a way to extract common behaviors shared by multiple classes into a superclass. All methods in a super class are available to the inheriting classes. The `<` symbol is used to show that a class is inheriting from a super class. For a class to override a method from a superclass, it needs to change the implementation of that method. Ruby uses the method lookup path to find the method first in the immediate class it's in, then it looks into the super class for the method. It stops looking when it finds the method, then invokes it.

```ruby
class Animal
  def speak
    puts "Hello!"
  end
end

class Cat < Animal
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
    
  def speak
    puts "#{name} says Meow!"
  end
end

class Dog < Animal
end

cat1 = Cat.new
cat1.speak # Gian says meow!
Dog.new.speak # Hello
```

***

### super

`super` is a built-in Ruby method that calls up the inheritance hierarchy. When used in a subclass's method, it looks up the chain for the method of the same name, and invokes it. Another common way of using `super` is within an `initialize` constructor method. 

```ruby
class Animal
  def speak
    "Hello!"
  end
end

class Dog < Animal
  def speak
    super + " from Dog class!"
  end
end

Dog.new.speak # "Hello! from Dog class!"
```

The purpose of writing DRY code is to extract common methods to a super class for multiple classes to use. This prevents us from repeating code multiple times. If a class inherits an already written method from a super class, it can change its implementation to fit the class. Inheritance is a way to model concepts that are naturally hierarchical.

***

#### Modules

Modules group common behaviors together similar to how a class does. To use a module, you need to use the `include [module name]` method invocation. All methods in the module are now available to use in the class. Unlike class inheritance where a class can only inherit from one class, a class can `mixin` as many modules as it needs. 

*Things of note*

- Mixing in modules is called **interface inheritance**. 
- When a class inherits from a super class, that's called **class inheritance**. In class inheritance, one type inherits the behaviors from another type; the result being a specialized type of the superclass. (you can modify a method inherited from a superclass) 
- You cannot instantiate an object from a module.
- Modules are only used in namespacing (grouping similar classes together) or grouping common methods together.
- Namespacing allows us to organize similar classes together under a module and reduces the chance of having some classes colliding their names with other classes.

*How to determine which to use*

- If there's a `is-a` relationship, then use **class inheritance**. 
- If there's a `has-a` relationship, then use **interface inheritance** mixins.
- Ex: a dog 'is a' animal (superclass), and 'has a/an' ability to 'swim' (module).

*Modules*

- Called interface inheritance when a class `includes` a module. This is a `mixin`
- Used for namespacing

- Used when there's a `has-a` relationship
- Groups common and reusable code into one place that can be used by multiple classes
- Classes can use as many modules as it needs
- Objects cannot be created from modules
- Example of polymorphism: prewritten code can be used by different classes
- Modules can be containers for methods, called *container methods*. These are methods that seem out of place in code.

***

### Equivalence

How to test if two variables have the same value:

```ruby
int1 = 1
int2 = 1
int1 == int2            # => true
```

How to test if two variables are pointing to the same object:

```ruby
str1 = "something"
str2 = "something"
str1_copy = str1

# comparing the string objects' values
str1 == str2            # => true
str1 == str1_copy       # => true
str2 == str1_copy       # => true

# comparing the actual objects
str1.equal? str2        # => false
str1.equal? str1_copy   # => true
str2.equal? str1_copy   # => false
```

***

#### The `==` method

`==` is an *instance method* available to all objects. This is **not** an operator. 

> How does `==` know what value to use for comparison?

- It's determined by the class

> What are the two ways to use the `==` method?

- ```ruby
  str1.==(str2)
  ```

- ```ruby
  str1 == str2
  ```

  This method is defined the `BasicObject` class, which is the parent class to all classes in Ruby. To specify the value to compare, each class should override the `==` method.

How to define a `==` method in a class, to override the `BasicObject` one:

```ruby
class Person
  attr_accessor :name

  def ==(other)
    name == other.name     # relying on String#== here
  end
end

bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

bob == bob2                # => true
```

You can use `==` on Array, Hash, String, Integer, and other objects. If you define a `==`, method, you also get `!=`.

***

### Object ID

Every object has an `object_id` method that returns a numerical value that identifies the object. This is used like `equal?` to determine if two variables are pointing to the same object. Here, these variables point to string objects with the same value, but they are *different* objects.

```ruby
str1 = "something"
str2 = "something"

str1.object_id            # => 70186013144280
str2.object_id            # => 70186013536580
```

Integers and symbols behave differently in that if two symbols or two integers have the **same value**, they are the **same object**. You cannot modify an integer or symbol. 

***

General Summary of Equality Methods

### The `==` method

- checks the values of two objects to see if they are same
- most built-in ruby classes override this method to specify how to compare objects of those classes
- to compare custom objects, override the `==` method
- by default `BasicObject#==` doesn't perform an equality check. It returns true if the two objects are pointing to the same value; this is why most classes override this method.

### The `equal?` method

- checks to see if two variables are pointing to the same object and if they have the same value
- do not override this method
- using `object_id` is the same as calling `equal?`

### The `===` method

- This is also an instance method and not a real operator. 
- This is used implicitly by the `case` statement.
- You rarely need to call this method explicitly

How `===` is used in an if/else statement with ranges:

```ruby
num = 25

if (1..50) === num
  puts "small number"
elsif (51..100) === num
  puts "large number"
else
  puts "not in range"
end
```

It's saying, "if `(1..50)` is a group, would `25` belong in that group?" Answer is yes, so 'small number' is output.

How `===` is used to compare objects with a String class:

```ruby
String === 'hello' # true
String === 15 # false
```

1. It's true on line one because `hello` is an instance of `String`, even though `hello` doesn't equal `String`
2. This is `false` because `15` is not part of the `String` class and it isn't an instance of `String`.

***

### The `eql?` method

- Checks to see if two objects contain the same value and if they are of the same class
- Rarely used, but implicitly used by `Hash`

***

## Variable Scope

### Instance Variables

- Scoped at the object level

- Can be accessed by an instance  method even if it's not initialized or passed in to the method

- Returns nil if instance variable is uninitialized and is trying to be accessed

- The variable must be initialized first in an instance method to be used by another instance method (usually in a constructor method)

  ```ruby
  class Person
    def initialize(n)
      @name = n
    end
  
    def get_name
      @name                     # is the @name instance variable accessible here?
    end
  end
  
  bob = Person.new('bob')
  bob.get_name                  # => "bob"
  
  ****************************************
      
  class Person
    def get_name
      @name                     # the @name instance variable is not initialized anywhere
    end
  end
  
  bob = Person.new
  bob.get_name                  # => nil
  ```

  

### Class Variables

- Scoped at the class level

- All objects of the class has access to one copy of the class variable

- Class methods can access class variables, regardless of where it's initialized

- Only class variables can share state between objects

  ```ruby
  class Person
    @@total_people = 0            # initialized at the class level
  
    def self.total_people
      @@total_people              # accessible from class method
    end
  
    def initialize
      @@total_people += 1         # mutable from instance method
    end
  
    def total_people
      @@total_people              # accessible from instance method
    end
  end
  
  Person.total_people             # => 0
  Person.new
  Person.new
  Person.total_people             # => 2
  
  bob = Person.new
  bob.total_people                # => 3
  
  joe = Person.new
  joe.total_people                # => 4
  
  Person.total_people             # => 4
  ```

  

### Constant Variables

- Constants are not meant to be changed

- They have *lexical scope*, which means their scope depends on where they are in the program

- They are available in both class and instance methods

  ```ruby
  class Person
    TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']
  
    attr_reader :name
  
    def self.titles
      TITLES.join(', ')
    end
  
    def initialize(n)
      @name = "#{TITLES.sample} #{n}"
    end
  end
  
  Person.titles                   # => "Mr, Mrs, Ms, Dr"
  
  bob = Person.new('bob')
  bob.name                        # => "Ms bob"  (output may vary)
  ```

  
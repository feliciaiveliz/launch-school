# Answer Sheet

#### What are classes? Give an example of a class.

Classes are an outline of what an object should be made of and what it should be able to do. Within a class is where you define an object's state and behavior. Classes group common behaviors that are used by its objects to perform specific actions. To create a class, use keyword `class` followed by the class name with first letter capitalized. If there are multiple words in the class name, use CamelCase style. End the class definition with keyword `end`.

```ruby
class Cat
end
```

#### What are objects and how do you create one?

Objects are instances of a class that encapsulate `state` and perform behaviors provided by a class. A class outlines what an object should be made of and what it should be able to do. An object's `state` is stored in `instance variables` and its behavior is exposed through `instance methods`. To instantiate a new object from a class, invoke the `new` class method on the class name. All objects of a class have different state but share common behaviors (methods).

```ruby
class Cat
end

Cat.new => #<Cat:0x0000000005179170>
```

#### What are instance variables?

Instance variables start with one `@` symbol. These are used to track information about an object's state. They are scoped at the object level and exist as long as the object exists. These are not created until the method in which they are created is called. The `setter` method will initialize an instance variable if an `initializer` method is not in a class. All uninitialized instance variables return `nil`.

```ruby
class Cat
  def initialize(name)
    @name = name
  end
end

my_cat = Cat.new("Gian") #<Cat:0x0000000005188e18 @name="Gian"> # "Gian" is assigned to the instance variable `@name`. `my_cat` now has `state` saved into the @name instance variable.
```

Example of instance variable `name` being created when it is called:

```ruby
class Cat
  attr_reader :name
  attr_writer :name
end

cat = Cat.new

p cat.instance_variables # => []
p cat.name               # => nil
p cat                    # => #<Cat:0x00000000050a0e60>

cat.name = "Gian"        
p cat.instance_variables # => [:@name]
p cat.name               # => "Gian"
p cat                    # #<Cat:0x00000000050a0e60 @name="Gian">
```

#### What are class variables?

Class variables start with two `@@` symbols and are instantiated at the *class* level. These variables capture information that deals only with the class itself. 

```ruby
class Cat
  @@number_of_cats = 0 # class variable initialized to 0
  
  def initialize # constructor
    @@number_of_cats += 1 # called everytime an object is created and increments @@number_of_cats by 1
  end
    
  def self.total_number_of_cats # class method definition
    @@number_of_cats # returns value of @number_of_cats
  end
end

cat1 = Cat.new
cat2 = Cat.new

Cat.total_number_of_cats # 2
```

#### What are instance methods?

Instance methods expose behavior for objects. These methods are available to all instances of a class and are called directly on the object. Instance methods are defined using keyword `def` followed by the method name in snake-case format. 

```ruby
class Cat
  def speak
    "Meow!"
  end
end

my_cat = Cat.new
puts my_cat.speak # => "Meow!"
```

#### What are class methods?

Class  methods are only concerned with the class itself, not with instances of a class. To define a class method, prepend `self` to the class method definition name. Use these methods if they do not deal with an object's state. Invoke a class method definition by calling the method name directly on the class's name. 

```ruby
class Cat
  def self.identity
    "I'm a cat class!"
  end
end

puts Cat.identity # => "I'm a cat class!"
```

***

#### `attr_*` methods

Use `attr_reader` to create a getter method. This method takes symbols as parameters and uses it to create the name for the getter method. Getter methods retrieve the value of an instance variable. Invoke the getter method by calling it directly on the object using `object_name.getter_method_name` syntax. In this example, it's `my_cat.name`. 

```ruby
class Cat
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

my_cat = Cat.new("Gian")
p my_cat.name # "Gian"
```

Use `attr_writer` to create a setter method. A setter method sets the value or changes the value of an attribute of an instance variable. Invoke a setter method using `setter_method_name=` syntax. Here, it's `my_cat.name = "Anakin"`. 

```ruby
class Cat
  attr_writer :name
  attr_reader :name
    
  def initialize(name)
    @name = name
  end
end

my_cat = Cat.new("Gian")
my_cat.name = "Anakin"
p my_cat.name # "Anakin"
```

Use `attr_accessor` to create getter and setter methods as well as instance variables to track an objects state. 

```ruby
class Cat
  attr_accessor :name
    
  def initialize(name)
    @name = name
  end
end

my_cat = Cat.new("Gian")
p my_cat.name # "Gian"
my_cat.name = "Booboo"
p my_cat.name # "Booboo"
```

How do you reference and set an instance variable within an instance method? What is the difference between doing this vs using getters and setters?

- It's better to reference a getter or setter method within an instance method so that we do not bypass any functionality that those methods might provide. If we access the instance variable directly, we don't have access to those methods that might need to modify the value of the instance variable in some way. 

```ruby
class Dog   
  attr_writer :name
    
  def initialize(name)
    @name = name
  end
    
  def name
    @name.capitalize
  end
    
  def greeting
    "My name is #{name}!"
  end
end

pepe = Dog.new("pepe")
puts pepe.greeting # => "My name is Pepe!"

Here, we can reference the getter method instead of the instance varible @name. 
```

If we reference the instance variable `@name`, then we won't have access the `name` method that modifies the value of the instance variable. 

```ruby
class Dog   
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
    
  def name
    @name.capitalize
  end
    
  def greeting
    "My name is #{@name}!"
  end
end

pepe = Dog.new("pepe")
puts pepe.greeting # => "My name is pepe!"
```

#### What is class inheritance and give an example?

Class inheritance is when a class inherits behaviors of another class. Class inheritance is a way to extract common behaviors shared by multiple classes into a superclass. The class that is inheriting behavior from another class is called the `subclass` and the class it inherits from is called the `superclass`.  The `<` symbol is used to show that a class is inheriting from another class. All methods in the superclass are available now to the subclasses. The subclass inherits the behaviors and attributes of its superclass. Use class inheritance if there is a `is-a'`relationship with a class and a superclass. For example: a dog `is an` animal. 

```ruby
class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def speak
    "Hello"
  end
end

class Dog < Animal
end

dog = Dog.new("Winston")

p dog.name  # "Winston"
p dog.speak # "Hello"
```



```ruby
class Animal
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
    
  def to_s
    "I'm #{self.name} and I say #{speak}"
  end
end

class Dog < Animal
  def speak
    "bark!"
  end
end

class Cat < Animal
  def speak
    "meow!"
  end
end

dog = Dog.new("Winston")
cat = Cat.new("Gian")

puts dog.speak # => bark!
puts cat.speak # => meow!

puts dog       # => I'm Winston and I say bark!
puts cat       # => I'm Gian and I say meow!   
```

#### What is interface inheritance? Why use it?

Interface inheritance, or multiple inheritance in Ruby is achieved through the use of `mixins` of `modules`. Modules are similar to classes in that they contain methods and variables. A class can `mixin` a module by using the `include` method invocation followed by the module name. All the methods and variables in the module are now available to use by the class. A class can do this if it needs more functionality since a class can only subclass from strictly one other class in class inheritance. 

```ruby
module Flyable
  def fly
    "I'm flying!"
  end
end

class Dog ; end

class Bird
  include Flyable
end

puts Dog.new.fly # `<main>': undefined method `fly' for #<Dog:0x00000000052886d8> (NoMethodError)
puts Bird.new.fly # "I'm flying!"
```

#### What is polymorphism?

Polymorphism is the ability of different objects to respond differently to the same method invocation. This can be achieved through inheritance (class or interface) and through duck typing. Prewritten code can be used for new purposes. 

Example of polymorphism through class inheritance: 

```ruby
class Animal
  def speak
    "hello"
  end
end

class Dog < Animal
end

class Cat < Animal
end

def greet_animal(animal)
  animal.speak
end

array_of_animals = [Animal.new, Dog.new, Cat.new]
array_of_animals.each do |animal|
  puts greet_animal(animal)
end

# hello
# hello
# hello
```

The array `array_of_animals` contains different animal objects, but we can treat them as generic animals that perform the same behavior, although in different ways. The `Cat` and `Dog` classes inherit from the `Animal` superclass, making the `speak` method in `Animal` available to its subclasses. `Cat` and `Dog` can now implement the `speak` method in their own way by overriding the `speak` instance method or they can use the `speak` instance method already written in `Animal`.

#### Polymorphism through interface inheritance:

```ruby
module Flyable
  def fly
    "I'm flying!"
  end
end

class Reptile ; end

class Bird
  include Flyable
end

puts Reptile.new.fly # `<main>': undefined method `fly' for #<Reptile:0x00000000052886d8> (NoMethodError)
puts Bird.new.fly # "I'm flying!"
```

The `Flyable` module is included in the `Bird` class through the use of multiple, or interface, inheritance. All methods in the module are available to the `Bird` class, but not `Reptile`, since it was not included in that class. This code is written in one place so it does not need to repeated wherever it's needed in a class.

#### Polymorphism through duck typing:

```ruby
class Snake
  def speak
    "Hiss"
  end
end

class Bird
  def speak
    "Tweet"
  end
end

class Cat
  def speak
    "Meow"
  end
end

def greet_animal(animal)
  animal.speak
end

array_of_animals = [Snake.new, Bird.new, Cat.new]

array_of_animals.each do |animal|
  puts greet_animal(animal)
end

# Hiss
# Tweet
# Meow
```

Duck typing in Ruby is another way to achieve polymorphism in Ruby without inheritance. It changes the implementation of a method with the same name. In the above example, we have a `speak` method in all three classes, but their implementation is different and specific to its class. 

#### What is encapsulation?

Encapsulation is the hiding or restriction of internal functionalities of objects or data in a program. This data is then unavailable to the rest of the codebase. It does this as a form of data protection, only exposing the methods and properties to users that need it. Ruby achieves this by creating objects and using private, protected and public methods to control the accessibility of the information of these objects.

```ruby
class Person
  attr_writer :age

  def initialize(name)
    @name = name
  end

  def show_age
    puts age
  end
    
  private

  attr_reader :age
end

person1 = Person.new("Felicia")
person1.age = 26
person1.show_age # => 26
puts person1.age # => `<main>': private method `age' called for #<Person:0x0000000005138af8 @name="Felicia", @age=26> (NoMethodError)
```

The getter method for `age` is private, which means that it can only be invoked from within the class. This value of `age` cannot be accessed outside of the class. 

#### Protected Methods

Protected methods work like public methods within a class but act like private methods from outside the class, in that they cannot be accessed outside the class. Protected methods allow access between class instances, while private methods do not. 

```ruby
class Person
  attr_writer :age

  def initialize(name)
    @name = name
  end

  def compare_ages(other_person)
    age == other_person.age
  end

  protected

  attr_reader :age
end

person1 = Person.new("Felicia")
person1.age = 26

person2 = Person.new("Kayla")
person2.age = 22

puts person1.compare_ages(person2)
```

#### Public methods

Public methods are readily available for use in the program by anyone who knows the class's or objects name. These comprise the class's interface. All methods by default in Ruby are public, except the *initialize* method.

#### What is method lookup path?

Ruby has a path that it follows to find a method when it's called. Use the `ancestors` method chained on the class name to return an array of places Ruby searches in the method lookup path. If a module is included in a class and that class also subclasses from a superclass, Ruby will first search the enclosing class for a method, then the module, than the superclass, followed by `Object`, `Kernel` and finally `BasicObject`. Once Ruby finds the method it's looking for, it stops looking. If Ruby cannot find a method, it throws an error. 

```ruby
module Flyable
end

class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal ; end

class Cat < Animal ; end

class Bird < Animal # Bird class includes a module and subclasses from super class Animal
  include Flyable 
end

p Bird.ancestors # => [Bird, Flyable, Animal, Object, Kernel, BasicObject]
```

#### What is `super`?

`super` is a built-in function in Ruby that calls methods up the inheritance hierarchy. From within a method, invoking `super` will cause it to search up the chain to find a method by that same name, then invoke it. This extends the functionality to the overridden method of the same name in the subclass. 

It's common to use them in the `initialize` method: 

```ruby
class Animal 
  attr_reader :name

  def initialize(name)
    @name = name
  end
end


class Bird < Animal
  attr_reader :feather_color

  def initialize(name, feather_color)
    super(name)
    @feather_color = feather_color
  end

  def to_s
    "I'm #{name} and I have #{feather_color} feathers!"
  end
end

bird1 = Bird.new("Bubbles", "red")
puts bird1
```

`Bird` class inherits from `Animal`, which means it inherits the `initialize` method as well as the getter method `name`. Since we need to add additional information to the `Bird#initialize` method, we can use `super` to call up to the `Animal#initialize` method and then add the 'feather_color' information to `Bird`. We need to pass `name` to the `super` call within `Bird#initialize` since that method takes only one parameter, `name`. When we create a new `Bird` object, we pass in two parameters, `name` and `feather_color`. This allows to assign the `bird1` object's name to `@name` (because of the `super` call) and it's feather color to `@feather_color.` 

#### super

It can also be used within any instance method in a class:

```ruby
class Animal
  def speak
    "Greetings!"
  end
end

class Cat < Animal
  def speak
    super + " from Cat class"
  end
end

mittens = Cat.new
mittens.speak        # => "Greetings! from Cat class"
```

The `super` call within `Cat#speak` called up to `Animal#speak` and allowed us to invoke it's message `Greetings!` along with the message in the `Cat#speak` method: `' from Cat class'`.

#### `self`

`self` is used as a way of being explicit about what we are referencing in our program and our intentions in terms of behavior. 

- `self` within a class but inside an instance method refers to the calling object- the instance or object that called the method. ex: `self.name=` is the same as `felicia.name=`. This is calling a setter method from within an instance method. This is important to use so that Ruby can distinguish between initializing a local variable versus calling a setter method to set an instance variable. 
- `self` within a class and outside of an instance method refers to the class itself and can be used to define class method definitions. ex: `def self.name=(name)` is the same as `def Cat.name=(n)`. 
  - A `class` methods are such that they are only concerned with operations of the class itself. They use `self.information` syntax. Use these methods if you do not need to deal with object's state. Call a class method by appending the class method definition name onto the name of the class at invocation: `Bird.information`.

Example of `self` inside an instance method referencing the `bird1` calling object: 

```ruby
class Bird
  attr_accessor :name, :feather_color

  def initialize(name, feather_color)
    @name = name
    @feather_color = feather_color
  end

  def change_feather_color(new_color)
    self.feather_color = new_color
    p self
  end

  def to_s
    "I'm #{name} and I have #{feather_color} feathers!"
  end
end

bird1 = Bird.new("Bubbles", "red")
puts bird1 # => I'm Bubbles and I have red feathers!
bird1.change_feather_color("black") # => #<Bird:0x00000000051784a0 @name="Bubbles", @feather_color="black">
puts bird1 # => I'm Bubbles and I have black feathers!
```

Example of `self` inside a class and outside of an instance method referencing the class itself: 

```ruby
class Bird
  attr_accessor :name, :feather_color

  def initialize(name, feather_color)
    @name = name
    @feather_color = feather_color
  end
  
  puts self

  def to_s
    "I'm #{name} and I have #{feather_color} feathers!"
  end
end

bird1 = Bird.new("Bubbles", "red")
puts bird1 # => I'm Bubbles and I have red feathers!
# `puts self` => Bird
```

Example of `self` inside a class and prepended to a class method definition, to reference the class itself:

```ruby
class Bird
  attr_accessor :name, :feather_color

  def initialize(name, feather_color)
    @name = name
    @feather_color = feather_color
  end

  def self.information
    "I'm a Bird class!"
  end

  def to_s
    "I'm #{name} and I have #{feather_color} feathers!"
  end
end

bird1 = Bird.new("Bubbles", "red")
puts bird1 # => I'm Bubbles and I have red feathers!
puts Bird.information # => I'm a Bird class!
```

#### Equality

`BasicObject#==` compares if two objects are the same. This is the equality method and it is usually overridden by custom classes. 

#### The `==` method

- Instance method belonging to the `BasicObject` class that most classes override. This method is available to all objects. `BasicObject#==` compares if two objects are the same. To override this method to compare if two objects contain the same `string value`, you can create a custom `==` method. Each class can implement a `==` method to specify how to compare two objects; arrays, hashes, strings, etc.

- You get `!=` if you custom implement `==`.

- If two symbols or integers have the same value, they are also the same object since they are immutable. 

- ```ruby
  class Cat
    attr_accessor :name
  
    def ==(other)
      name == other.name     # relying on String#== here
    end
  end
  
  cat1 = Cat.new
  cat1.name = "Gian"
  
  cat2 = Cat.new
  cat2.name = "Gian"
  
  cat1 == cat2 # => true
  ```

#### Object Id

`object_id` is a method call available for every object. It returns a numerical value that identifies the object. It works similarly to the `equal?` method in that it checks to see if two variables are pointing to the same object. 

Example of using `object_id`:

```ruby
str1 = "meow"
str2 = "meow"

str1.object_id            # => 70186013148970
str2.object_id            # => 70186013532270
```

#### The `equal?` method

- Determines whether two variables have the same value and if they are also pointing to the same object
- Do not override this method
- Using this method and `object_id` works the same way

#### The `===` method

- These are used implicitly in case statements

- This is rarely called explicitly

- Use it in custom classes if your objects will be used in case statements, which is rare.

- When used in a `case` statement with ranges and a number, it asks if that number would be included in that range. If true, that branch evaluates to true. 

- ```ruby
  n = 7
  
  if (1..50) === n
    puts "small number"
  elsif (51..100) === n
    puts "large number"
  else
    puts "out of range"
  end
  
  # "small number"
  ```

- ```ruby
  String === "meow" # => true, "meow" is an object of the String class
  String === 7   # => false, Integer 7 is not part of the String class
  ```

#### The `eql?` method

- This is used implicitly used `Hash`

- very rarely used

  

### Fake Operators

Some operators are actually methods that we can override.

#### Comparison Methods

#### The `>` method

- This method is overridden depending on what you're comparing. To use it in a class, specify what you're comparing (most likely integers). 

- Defining this method doesn't give `<`; we need to define that ourselves.

- ```ruby
  class Person
    attr_accessor :name, :age
  
    def initialize(name, age)
      @name = name
      @age = age
    end
      
    def >(other_person)
      age > other_person.age
    end
  end
  
  felicia = Person.new("Felicia", 26)
  kayla = Person.new("Kayla", 22)
  
  felicia > kayla # => true
  ```

  

#### The `<<` and `>>` methods

- Using the method is common when working with collections such as arrays, but not with hashes

- ```ruby
  class Zoo
    attr_accessor :animals
  
    def initialize
      @animals = []
    end
  
    def <<(animal)
      animals.push(animal)
    end
  end
  
  class Animal
    def initialize(name, type)
      @name = name
      @type = type
    end
  end
  
  san_antonio_zoo = Zoo.new
  
  elephant = Animal.new("Ellie", 'elephant')
  tiger = Animal.new("Lucy", 'tiger')
  
  san_antonio_zoo << elephant << tiger
  
  p san_antonio_zoo.animals # => [#<Animal:0x00000000051b9ae0 @name="Ellie", @type="elephant">, #<Animal:0x00000000051b9900 @name="Lucy", @type="tiger">]
  ```

  

#### The `plus` method

- This is actually not an operator but a method call to `#+`. 

- `Integer#+` increments the value by value of the argument; returns a new integer

- `String#+` concatenates with the argument; returns a new string

- `Array#+` concatenates with the argument; returning a new array

- `Date#+` increments the date in days by value of the argument; returns a new date

- Basic pattern is either incrementing or concatenating.

  

#### Element setter and getter methods

- `Array#[]` is a getter method for a collection object, such as an array. 

- ```ruby
  numbers = %w(zero one two three)
  
  numbers[1]    # one
  numbers.[](1) # one
  ```

- `Array#[]=` is a setter method for an array.

- ```ruby
  numbers = %w(zero one two three)
  
  numbers[4] = "four"
  numbers.[]=(4, "four")
  p numbers # => ['zero' 'one' 'two' 'three', 'four']
  ```

  

To use these methods in custom classes:

```ruby
class Zoo
  attr_accessor :animals

  def initialize
    @animals = []
  end

  def <<(animal)
    animals.push(animal)
  end

  def [](idx)
    animals[idx]
  end
  
  def []=(idx, obj)
    animals[idx] = obj
  end
end

class Animal
  def initialize(name, type)
    @name = name
    @type = type
  end
end

san_antonio_zoo = Zoo.new
elephant = Animal.new("Ellie", 'elephant')
tiger = Animal.new("Lucy", 'tiger')
san_antonio_zoo << elephant << tiger

p san_antonio_zoo[0] # #<Animal:0x0000000005168ff0 @name="Ellie", @type="elephant">
san_antonio_zoo[2] = Animal.new("Fluffly", 'bear')

p san_antonio_zoo.animals # [#<Animal:0x0000000005168ff0 @name="Ellie", @type="elephant">, #<Animal:0x0000000005168eb0 @name="Lucy", @type="tiger">, #<Animal:0x0000000005168c80 @name="Fluffly", @type="bear">]  
```

### Collaborator Objects

A collaborator object is an object that is stored as state within another object of another class. 


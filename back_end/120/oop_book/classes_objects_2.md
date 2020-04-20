# Classes and Objects - Part 2

### Class Methods

So far, all the methods that we've created have been instance methods, that is, they pertain to instances or objects of a class. There are also class level methods, called **class methods**. These are called directly on the class itself, without having to instantiate objects. 

To define a class method, prepend the method name with the reserved word `self.`:

```ruby
# other code

def self.what_am_i # Class method definition
  "I'm a GoodDog class!"
end
```

To call the class method, we use the class name `GoodDog` followed by the method name, without even having to instantiate any objects. 

```ruby
GoodDog.what_am_i # => I'm a GoodDog class!
```

Class methods are where we put functionality that does not pertain to individual objects. Objects contain state. If we have a method that does not need to deal with states, then we can just use a class method. 

### Class Variables

We can create variables for an entire class that are called **class variables**. These are created using two `@@` symbols. This is just like creating instance variables that capture information related to specific instances of an object. 

```ruby
class GoodDog
  @@number_of_dogs = 0
  
  def initialize # instance method
    @@number_of_dogs += 1
  end
    
  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs # => 0

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs # => 2
```

We have a class variable called `@@number_of_dogs` that is initialized to 0. Then in the constructor (the `initialize` method), we increment the number by 1. 

> Remember that `initialize` gets called everytime we instantiate a new object via the `new` method. 

### Constants

Constants are variables that are never meant to be changed. You define a constant by using uppercase for the whole name. 

```ruby
class GoodDog
  DOG_YEARS = 7
  
  attr_accessor :name, :age
    
  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age # => 28
```

We use the setter methods in the `initialize` method to initialize the `@name` and `@age` instance variables given to us by the `attr_accessor` method. Then we used the `age` getter method to retrieve the value from the object.

### More About Self

Two clear use cases for `self`:

1. Use `self` when calling setter methods from within the class. `self` allows Ruby to distinguish between initializing a local variable and calling a setter method.
2. Use `self` for class method definitions.

```ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name   = n
    self.height = h
    self.weight = w
  end

  def change_info(n, h, w)
    self.name   = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end
end
```

We're using `self` whenever we call an instance method from within the class. What does `self` mean here?

```ruby
class GoodDog
  # omitted code
    
  def what_is_self
    self
  end
end
```

Instantiate a new `GoodDog` object:

```ruby
sparky = GoodDog.new("Sparky", "12 inches", "10 lbs")
p sparky.what_is_self
# => #<GoodDog:0x007f83ac062b38 @name="Sparky", @height="12 inches", @weight="10 lbs">
```

From within the class, when an instance method uses `self`, it references the *calling object*, in this case the `sparky` object. From within the `change_info` method, calling `self.name=` acts the same as calling `sparky.name=` from *outside* the class (you can't call `sparky.name=` inside the class though since it isn't in scope). 

The other place where `self` is used is when we're defining class methods. 

```ruby
class MyAwesomeClass
  def self.this_is_a_class_method
  end
end
```

A class method is defined when `self` is prepended to a method definition. In our previous example, we defined a class method called `self.total_number_of_dogs`. This method returned the value of the class variable `@@number_of_dogs`. How? 

```ruby
class GoodDog
  # ... rest of code omitted for brevity
  puts self
end
```

Now we can see that using `self` inside a class but outside an instance method refers to the class itself. A method definition prefixed with `self` is the same as defining the method on the class. That is, `def self.a_method` is equal to `def GoodDog.a_method`. This is why it's a class method; it's being defined on the class. 

From within a class:

1. `self`, inside of an instance method, references the instance (object) that called the method - the calling object. Therefore, `self.weight=` is the same as `sparky.weight=`. 
2. `self`, outside of an instance method, references the class and can be used to define class methods. Therefore, `def self.name=(n)` is the same as `def GoodDog.name=(n)`.

***Memorize those two rules**


# Inheritance and Variable Scope

How does inheritance affect variables?

### Instance Variables

How sub-classing affects instance variables:

```ruby
class Animals 
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def dog_name
    "bark! bark! #{@name} bark! bark!"    # can @name be referenced here?
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name                       # => bark! bark! Teddy bark! bark!
```

We call `Dog.new` when we instantiated 'teddy'. Since the `Dog` class doesn't have an `initialized` instance method, the method lookup path went to the super class `Animal` and executed `Animal#initialize`. That's when the `@name` instance variable was initialized and that's why we can access it from `teddy.name`.

One small tweak:

```ruby
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"    # can @name be referenced here?
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name                       # => bark! bark! bark! bark!
```

Here, the name is `nil`, because the `Animal#initialize` instance method was never executed and thus `@name` is never initialized. Uninitialized instance variables return `nil`. 

What about mixing in modules?

```ruby
module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
teddy.swim                                  # => nil
```

Since we didn't call the `enable_swimming` method from `Swim`, the instance variable `can_swim` was never initialized. To initialize it, we need to call it:

```ruby
teddy = Dog.new
teddy.enable_swimming 
teddy.swim # "swimming!"
```

> Instance variables work similar to instance methods, except that we need to first **call the method that initializes the instance variable**. Once we do that, the instance (object) can access that instance variable (via an instance method).

***

### Class Variables

Experiment:

```ruby
class Animal
  @@total_animals = 0

  def initialize
    @@total_animals += 1
  end
end

class Dog < Animal
  def total_animals
    @@total_animals
  end
end

spike = Dog.new
spike.total_animals                           # => 1
```

Class variables are accessible to sub-classes. This class variable `total_animals` is initialized in the `Animal` class, but there is no method to explicitly invoke to initialize it. The class variable is loaded when the class is evaluated by Ruby. 

But there's a problem:

```ruby
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

Vehicle.wheels                              # => 4
```

It can be dangerous working with class variables within the context of inheritance, because there is only one copy of the class variable across all sub-classes.

Above, we initialize a class variable `@@wheels`, then expose a class method to return the value of the class variable `@@wheels`. Now we'll add a sub-class that overrides this class variable.

```ruby
class Motorcycle < Vehicle
  @@wheels = 2
end

Motorcycle.wheels                           # => 2
Vehicle.wheels                              # => 2  Yikes!
```

This change affected the class variable in the super class `Vehicle`. All other class that inherit from this class will be affected also. 

```ruby
class Car < Vehicle
end

Car.wheels                                  # => 2  Not what we expected!
```

Avoid using class variables when working with inheritance. The solution is to use class instance variables, but that's later.

***

### Constants

We can access constants from instance or class methods when defined within a class. Can we reference a constant define in a different class?

```ruby
class Dog
  LEGS = 4
end

class Cat
  def legs
    LEGS
  end
end

kitty = Cat.new
kitty.legs                                  # => NameError: uninitialized constant Cat::LEGS
```

The error here is that Ruby is looking for a `LEGS` variable within the `Cat` class. This is the same behavior as class or instance variables (except for uninitialized instance variables returning `nil`).

We can reach into the `Dog` class and reference the `LEGS` constant. You have to tell Ruby where the constant is using `::`, which is the namepace resolution operator.

```ruby
class Dog
  LEGS = 4
end

class Cat
  def legs
    Dog::LEGS                               # added the :: namespace resolution operator
  end
end

kitty = Cat.new
kitty.legs                                  # => 4
```

How do constants work with inheritance?

```ruby
class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  def self.wheels
    WHEELS
  end

  def wheels
    WHEELS
  end
end

Car.wheels                                  # => 4

a_car = Car.new
a_car.wheels                                # => 4
```

A constant initialized in a super class in inherited by the sub-class and can be accessed by both the class and instance methods. 

Things change when we try to mix in modules. 

```ruby
module Maintenance
  def change_tires
    "Changing #{WHEELS} tires."
  end
end

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintenance
end

a_car = Car.new
a_car.change_tires                          # => NameError: uninitialized constant Maintenance::WHEELS
```

Unlike instance methods or variables, constants are not evaluated at runtime, so their lexical scope - or where they are in the code - is important. Even though we call the `change_tires` method from the `a_car` object, Ruby is not able to find the constant. 

Two ways to fix it:

```ruby
module Maintenance
  def change_tires
    "Changing #{Vehicle::WHEELS} tires."    # this fix works
  end
end
```

or 

```ruby
module Maintenance
  def change_tires
    "Changing #{Car::WHEELS} tires."        # surprisingly, this also works
  end
end
```

The second one works because we're telling Ruby to look for the `WHEELS` constant in the `Car` class, which can access `Vehicle::WHEELS` through inheritance.

**Summary**:

- Instance Variables: Make sure the instance variable is initialized before referencing it.
- Class Variables: Dangerous because they allow sub-classes to override super-class class variables. This change will affect other classes inheriting from the super-class. Some Rubyists avoid using these altogether.
- Constants: These have lexical scope which makes their scope resolution rules very unique compare to other variable types. If it doesn't find the constant using lexical scope, it'll look at the inheritance hierarchy. 
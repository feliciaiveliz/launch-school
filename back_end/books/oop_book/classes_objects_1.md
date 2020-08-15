# Classes and Objects - Part 1

Classes are used to create objects. When defining a class, we focus on two things: *states* and *behaviors*. States track attributes for individual objects and behaviors are what objects are capable of doing. From the previous `GoodDog` class, we could create two `GoodDog` objects, one named "Fido" and one named "Sparky". They are both objects from the same class, but they may contain different information, such as name, weight, and height. Instance variables are used to track this information. These variables are scoped at the object (or instance) level and these are how objects keep track of their states. 

Even though they're two different objects, they are from the same class and contain identical behaviors. These behaviors are defined as instance methods in a class and are available to all objects of the same class. For example, all `GoodDog` objects should be able to run, bark, fetch and perform other common behaviors of all good dogs.

### **Initializing a New Object**

```ruby
class GoodDog
  def initialize
    puts "This object was initialized!"
  end
end

sparky = GoodDog.new # => "This object was initialized!"
```

The `initialize` method gets called every time an object is created. Even though we call the `new` class method at creation, the `new` method leads us to the `initialize` instance method. In the example, instantiating a new `GoodDog` object triggered the `initialize` instance method and resulted in the string being outputted. The `initialize` method here is referred to as a **constructor**, because it gets triggered whenever we create a new object.

### **Instance Variables**

Now we'll create a new object and instantiate it with a state, like a name.

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end
end
```

- **Instance Variable**: a variable that starts with an `@` symbol. This variable exists as long as the object exists and is one of the ways we tie data to objects. It doesn't 'die' after the initialize method is run. It 'lives on' to be referenced until the object is destroyed.

In the example, our `initialize` method takes a parameter called `name`. You can pass arguments into the `initialize` method through the `new` method. 

Create an object using the `GoodDog` class from above:

```ruby
sparky = GoodDog.new("Sparky")
```

The string "Sparky" is passed from the `new` method through to the `initialize` method and is being assigned to the local variable `name`. Within the `constructor`, (the `initialize` method), we then set the instance variable `@name` to `name`. This results in assigning the string "Sparky" to `@name` instance variable. 

This example shows that instance variables are used to keep track of information of the states of an object. The name of the `sparky` object is "Sparky" and this state for the object is tracked in the instance variable `@name`. If we created another `GoodDog` object, for example with `fido = GoodDog.new("Fido")`, then the `@name` instance variable for the `fido` object would contain the string `Fido`. Every object's state is unique, and instance variables are how we keep track of them.

### **Instance Methods**

Let's give our `GoodDog` class some behaviors. 

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "Woof!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak # => "Woof!"
```

Here, the `speak` method returned the string "Woof!" and `puts` outputs this to the screen. 

Suppose we had another `GoogDog` object:

```ruby
fido = GoodDog.new("Fido")
puts fido.speak # => "Woof!"
```

This `fido` object can also perform `GoodDog` behaviors. All objects of the same class have the same behaviors, but they contain different states, in this case the differing state is the name.

If we wanted to say something like "Sparky says woof!", we could change our `speak` method. All of the methods in the class `GoodDog` are instance methods, so that means we have access to instance methods. 

```ruby
def speak
  "#{@name} says woof!"
end
```

We can now expose information about the state of the object using instance methods.

```ruby
puts sparky.speak # => "Sparky says woof!"
puts fido.speak # => "Fido says woof!"
```

### **Accessor Methods**

What if we wanted to print only `sparky`'s name? 

```ruby
puts sparky.name => NoMethodError: undefined method `name' for #<GoodDog:0x007f91821239d0 @name="Sparky">
```

This means that we called a method that doesn't exist or is unavailable to the object. If we want to access the object's name, which is stored in the `@name` instance variable, we have to create a method that will return the name. Here, we can call it `get_name` and its only job is to return the value in the `@name` instance variable.

```ruby
class GoodDog # class
  def initialize(name)
    @name = name
  end
    
  def get_name # getter method
    @name # instance variable
  end
    
  def speak # method
    "#{@name} says woof!"
  end
  
sparky = GoodDog.new("Sparky") # creating a GoodDog object
puts sparky.speak # Sparky says woof!
puts sparky.get_name # Sparky
```

`get_name` is now a getter method. What happens if we wanted to change `sparky`'s name? Then we would need a *setter* method. 

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end
    
  def get_name #getter method
    @name
  end
    
  def set_name=(name) # setter method
    @name = name
  end
    
  def speak # method
    "#{@name} says woof!"
  end
    
  sparky = GoodDog.new("Sparky")
  puts sparky.speak # "Sparky says woof!"
  puts sparky.get_name # Sparky
  sparky.set_name = "Spartacus"
  puts sparky.get_name # Spartacus
```

To use the `set_name=` method normally, we would usually do this: `sparky.set_name=('Spartacus')` , where the entire "set_name=" is the method name and the string "Spartacus" is the argument being passed in to the method. Ruby recognizes that this is a setter method and allows us to use the more natural syntax: `sparky.set_name = "Spartacus"`. This is Ruby's syntactical sugar.

Rubyists usually name those *getter* and *setter* methods the same name as the instance variable they are exposing and setting.

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end
  
  def name
    @name
  end
    
  def name=(n)
    @name = n
  end
    
  def speak
    "#{@name} says woof!"
  end
end

sparky = GoodDog.new("Sparky") # instantiating an object 
puts sparky.speak # "Sparky says woof!"
puts sparky.name # "Sparky"
sparky.name = "Spartacus" 
puts sparky.name # "Spartacus"
```

```ruby
class GoodDog
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
    
  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak # "Sparky says arf!"
puts sparky.name # Sparky
sparky.name = "Spartacus"
puts sparky.name # Spartacus
```

The output is the same. The `attr_accessor` method takes a symbol as an argument and uses it to create the method name for the `getter` and `setter` methods. If we only want the `getter` method, use `attr_reader`. It works the same way but only allows you to retrieve the instance variable. If we want only the `setter` method, use `attr_writer`. All `attr_*` methods take a symbol as parameters. If there are multiple states to track use this syntax:

```ruby
attr_accessor :name, :height, :weight
```

### **Accessor Methods in Action**

With getter and setter methods, we have a way to expose and change an object's state. These methods can be used within the class as well. Previously, the `speak` method referenced the `@name` instance variable:

```ruby
def speak
  "#{@name} says arf!"
end
```

Instead of referencing the variable directly, use the `name` getter method created earlier, which is given to us by `attr_accessor`:

```ruby
def speak
  "#{name} says arf!"
end
```

It's generally a good idea to reference the instance **method** rather than the instance **variable**. Example: if we want to keep track of a social security number in an instance variable called `@ssn`. When we retrieve it, we want to only see the last 4 digits and mask the rest: "xxx-xx-1234". If we were referencing the variable directly, we would have to use this code for the entire class:

```ruby
# converts '123-45-6789' to 'xxx-xx-6798'
'xxx-xx-' + @ssn.split('-').last
```

It's easier to reference a getter method and make the change in one place:

```ruby
def ssn
  'xxx-xx-' + @ssn.split('-').last
end
```

We can now use the `ssn` instance method (without the `@`) throughout the class to retrieve the social security number. As with the getter methods, the same idea applies for setter methods. Now we'll add two more states to track to the `GoodDog` class called 'height' and 'weight'.

```ruby
attr_accessor :name, :height, :weight
```

This code gives us **six** getter/setter methods: `name`, `name=`, `height`, `height=`, `weight`, `weight=`. This also gives us **three** instance variables: `@name`, `@height`, `@weight`. Now we can create a method that allows us to change several states at once, called `change_info(n, h, w)`. We'll also create a method called `info` to display all the states of the object. 

```ruby
def change_info(n, h, w)
  @name = n
  @height = h
  @weight = w
end
```

```ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end
```

We can use the `change_info` method like this:

```ruby
sparky = GoodDog.new("Sparky", "12 inches", "10 lbs")
puts sparky.info # => Sparky weighs 10 lbs and is 12 inches tall.

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.
```

We should also replace the instance variables with our instance methods for our setter methods.

```ruby
def change_info(n, h, w)
  name = n
  height = h
  weight = w
end
```

This does not change the information like above:

```ruby
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.
```

### Calling Methods with `self`

Ruby thought that we wanted to initialize local variables instead of calling the setter methods `name=`, `height=`, and `weight=`. We ended up creating three new local variables `name`, `height`, and `weight`. 

To differentiate between a local variable and calling a setter method, we need to use `self.name=` to call a method.

```ruby
def change_info(n, h, w)
  self.name = n
  self.height = h
  self.weight = w
end
```

If we wanted we could adopt the same syntax for our `info` getter method, but it is not required:

```ruby
def info
  "#{self.name} weighs #{self.weight} and is #{self.height} tall."
end
```

Now our code runs perfectly: 

```ruby
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.
```
# Variable Scope

### Instance Variable Scope

Instance variables are scoped at the object level. They are used to keep track of object state and do not cross over between objects. We can use a `@name` variable to separate the state of `Person` objects.

```ruby
class Person
  def initialize(n)
    @name = n
  end
end

bob = Person.new("bob")
joe = Person.new("joe")

puts bob.inspect # => #<Person:0x007f9c830e5f70 @name="bob">
puts joe.inspect # => #<Person:0x007f9c830e5f20 @name="joe">
```

This means that the instance variable is accessible in an object's instance methods, even if it's initialized outside of that instance method.

```ruby
class Person
  def initialize(n) # initialized outside of the 'get_name' method, but still available to it
    @name = n
  end
end

def get_name
  @name
end

bob = Person.new('bob')       
bob.get_name # => "bob"
```

Unlike local variables, instance variables are accessible within an instance method even if they are not initialized or passed in to the method. Their scope is at the *object* level. 

What if we tried to access an instance variable that has not been initialized anywhere?

```ruby
class Person
  def get_name
    @name    # The @name instance variable is not initialized anywhere
  end
end

bob = Person.new
bob.get_name => nil
```

Another distinction: If you try to reference an uninitialized local variable, you get a `NameError`. But if you try to reference an uninitialized instance variable, you get `nil`. 

What happens if you accidently put an instance variable at the `class` level?

```ruby
class Person
  @name = 'bob'  # class level initialization
  
  def get_name
    @name
  end
end

bob = Person.new
bob.get_name     # nil
```

**Don't do that for now**. These become *class instance variables*. Just initialize instance variables within instance methods.

***

### Class Variable Scope

Class variables start with two `@@` and are scoped at the class level. They exhibit two main behaviors.

- all objects share 1 copy of the class variable. (Objects can access class variables by way of instance methods)
- class methods can access class variables, regardless of where it is initialized.

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

Even though we have two different people objects in the `Person` class, we can access and modify one copy of the `@@total_people` class variable. We can't do this with instance variables or local variables. 

### Constant Variable Scope

Constants begin with a capital letter and have *lexical scope*.

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

Constants are available in class methods or instance methods (which implies that it's accessible from objects).
# Fake Operators

From the previous assignment: `==` is actually a method that just *looks* like an operator due to Ruby syntax. 

These are the same:

`str1 == str2` == `str.==(str2)`

Operators that are actually methods can be overridden. 

***

### Equality methods

One of the most common fake operators to be overidden is the `==` equality operator. It's useful to override it and it gives us also the `!=` method. 

### Comparison Methods

Implementing the comparison methods gives us nice syntax for comparing objects.

```ruby
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

bob = Person.new("Bob", 49)
kim = Person.new("Kim", 33)
```

What happens if we try to compare them?

```ruby
puts "bob is older than kim" if bob > kim
```

We get a `NoMethodError`. Ruby can't find the `>` method for `bob`. We can add this method to the person class.

```ruby
class Person
  # ... rest of code omitted for brevity

  def >(other_person)
    age > other_person.age
  end
end
```

This method will return true if the current object's age is greater than the `other_person's` age and false otherwise. We are pushing the comparison functionality to the `Integer#>` method. 

```ruby
puts "bob is older" if bob > kim            # => "bob is older"
puts "bob is older" if bob.>(kim)           # => "bob is older"
```

*This does not give us `<`. We have to write our own method for that.

***

### The `<<` and `>>`  shift method

`<<` is standard to write:

```ruby
my_array = %w(hello world)
my_array << "!!"
puts my_array.inspect                       # => ["hello", "world", "!!"]
```

Before, we would have thought that `<<` was an operator, but it is actually an array method `Array#<<`. This is why we can't do this for hashes because `Hash` doesn't have a `<<` method.

```ruby
my_hash = {a: 1, b: 2, c: 3}
my_hash << {d: 4}                           # => NoMethodError: undefined method `<<' for Hash
```

Choose functionality that makes sense when used with the special operator-like syntax. The `<<` method works well when working with a class that represents a collection. 

```ruby
class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end
end

cowboys = Team.new("Dallas Cowboys")
emmitt = Person.new("Emmitt Smith", 46)     # suppose we're using the Person class from earlier

cowboys << emmitt                           # will this work?

cowboys.members                             # => [#<Person:0x007fe08c209530>]
```

***

### The plus method

One of the first things you'll see when learning to program is this: `1 + 1 == 2`. This is actually a method call.

```ruby
1 + 1 => 2
1.+(1) => 2
```

This is why Rubyists say *everything in Ruby is an object*. Integers are objects too as they are objects of the `Integer` class. They have access to instance methods of that class. When should we write a `+` method for our own objects?

- `Integer#+`: increments the value by value of the argument, returning a new integer
- `String#+`: concatenates with argument, returning a new string
- `Array#+`: concatenates with argument, returning a new array
- `Date#+`: increments the date in days by value of the argument, returning a new date

The pattern here is that you should be using `+` to increment or concatenate things.

```ruby
class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    members + other_team.members
  end
end

# we'll use the same Person class from earlier

cowboys = Team.new("Dallas Cowboys")
cowboys << Person.new("Troy Aikman", 48)
cowboys << Person.new("Emmitt Smith", 46)
cowboys << Person.new("Michael Irvin", 49)


niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 59)
niners << Person.new("Jerry Rice", 52)
niners << Person.new("Deion Sanders", 47)
```

```ruby
dream_team = cowboys + niners               # what is dream_team?
```

This implementation is the same as `cowboys.+(niners)`. If we look at the implementation, we see that it returns a new array object. This example returns an array of `Person` objects. 

Our `Team#+` method should return a new `Team` objects. We could initialize the new team to "Temporary Team" for now.

```ruby
class Team
  # ... rest of class omitted for brevity

  def +(other_team)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
    temp_team
  end
end
```

Now we can do this:

```ruby
dream_team = niners + cowboys
puts dream_team.inspect                     # => #<Team:0x007fac3b9eb878 @name="Temporary Team" ...
```

Now, `dream_team` is no longer an array but a `Team` object. 

***

### Element setter and getter methods

The `[]` and `[]=` methods are the most surprising because the syntax is so extreme.

```ruby
my_array = %w(first second third fourth)    # ["first", "second", "third", "fourth"]

# element reference
my_array[2]                                 # => "third"
my_array.[](2)                              # => "third"
```

These two are both identical.

Now for `Array#[]=`:

```ruby
# element assignment
my_array[4] = "fifth"
puts my_array.inspect                            # => ["first", "second", "third", "fourth", "fifth"]

my_array.[]=(5, "sixth")
puts my_array.inspect                            # => ["first", "second", "third", "fourth", "fifth", "sixth"]
```

If we want to use the element setter and getter methods in our class then we need a class that is working with a collection. We will build them as simple getter (reference) and setter (assignment) methods for elements in our collection.

```ruby
class Team
  # ... rest of code omitted for brevity

  def [](idx)
    members[idx]
  end

  def []=(idx, obj)
    members[idx] = obj
  end
end
```

`@members` is an array so we can push the work to the `Array#[]` and `Array#[]=` methods.

```ruby
# assume set up from earlier
cowboys.members                           # => ... array of 3 Person objects

cowboys[1]                                # => #<Person:0x007fae9295d830 @name="Emmitt Smith", @age=46>
cowboys[3] = Person.new("JJ", 72)
cowboys[3]                                # => #<Person:0x007fae9220fa88 @name="JJ", @age=72>
```

Now we can do both element reference and assignment using `Team#[]` and `Team#[]=`. 

**Summary**:

- Many operators are actually methods that Ruby gives special treatment to
- We can implement them in our classes and take advantage of the special syntax for our own objects
- We have to be careful to follow conventions set in the Ruby standard library
# Collaborator Objects

Classes group common behaviors and objects encapsulate 'state'. The object's state is saved in an object's instance variables. Instance methods can operate on the instance variables. Usually, the state is a string or number. 

```ruby
Class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

joe = Person.new("Joe")
joe.name  # => "Joe"
```

`@name` holds a string object. `"Joe"` is an object of the `String` class. Instance variables can hold any object, including arrays and hashes.

```ruby
class Person
  def initialize
    @heroes = ['Superman', 'Spiderman', 'Batman']
    @cash = {'ones' => 12, 'fives' => 2, 'tens' => 0, 'twenties' => 2, 'hundreds' => 0}
  end

  def cash_on_hand
    # this method will use @cash to calculate total cash value
    # we'll skip the implementation
  end

  def heroes
    @heroes.join(', ')
  end
end

joe = Person.new
joe.cash_on_hand            # => "$62.00"
joe.heroes                  # => "Superman, Spiderman, Batman"
```

Instance variables can also be set to a custom class we've created. Say we create a `Person` class with a `Pet`.

```ruby
class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Robert")    # creating instance of Person class
bud = Bulldog.new             # assume Bulldog class from previous assignment

bob.pet = bud # setting 'bob's instance variable @pet to 'bud', which is a BullDog object
```

We have set `bob`'s `@pet` instance variable to `bud`. When we call `bob.pet`, it is returning a `Bulldog` object. 

```ruby
bob.pet                       # => #<Bulldog:0x007fd8399eb920>
bob.pet.class                 # => Bulldog
```

Because `bob.pet` returns a `Bulldog` object, we can chain any `Bulldog` methods on the end:

```ruby
bob.pet.speak => "bark!"
bob.pet.fetch => "fetching!"
```

- **Collaborator Objects**: Objects that are stored as state within another object.
- These work in conjuction (or in collaboration) with the class they are associated with. 

`bob` has a collaborator object stored in the `@pet` variable. When we need that `Bulldog` object to perform some action (we want to access some behavior of `@pet` ), then we can go through `bob` and call the method on the object stored in `@pet` such as `speak` or `fetch`.

When we work with collaborator objects, they are usually custom objects (defined by the programmer); `@pet` is a custom object. 

```ruby
class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets                      # => [#<Cat:0x007fd839999620>, #<Bulldog:0x007fd839994ff8>]
```

You cannot just call `Pet` methods on `pets`:

```ruby
bob.pets.jump => NoMethodError: undefined method jump...
```

If we want to make the individual objects in the pet array jump, then we need to parse out the elements in the array and operate on the individual `Pet` object.

```ruby
bob.pets.each do |pet|
  pet.jump
end
```

### Summary

Instance variables can hold any type of object: strings, integers, arrays, hashes, etc. Collaborator objects allow you to modularize the problem domain into cohesive pieces. 
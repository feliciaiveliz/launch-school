## Study Guide 

### Classes and Objects

Classes are blueprints for objects. They define what an object should be and what it should be able to do. Classes are the molds and you create objects from those molds. You define a class by using the `class` keyword followed by the class name starting with a capital letter. To finish a class definition, use the `end` keyword.

This is how you define a class:

```ruby
class Cat
end
```

To create, or instantiate an object, you invoke the `new` method invocation on the class. You can save this object to a local variable, or chain more methods directly on the object.

This is how you create an object from a class:

```ruby
class Cat
end

cat1 = Cat.new
```

There are two main things to think about when creating objects; their `state` and their `behavior`. An object's `state` tracks attributes for an object and is how we tie data to them. Behaviors are what an object should be able to do.

`Instance variables` start with one `@` symbol and are scoped at the object level. These are used to track an object's state. 

This is an instance variable:

```ruby
@name # "Felicia"
```

`Instance methods` expose behavior for an object. 

Setter methods set an instance variable and getter methods retrieve the value of that instance variable.

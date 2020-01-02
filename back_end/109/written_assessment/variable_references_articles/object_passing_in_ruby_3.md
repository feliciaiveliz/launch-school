# Object Passing in Ruby - Pass by Reference or Pass by Value

In Ruby nearly everything is an object. When a method is called with an expression as an argument, that expression is evaluated and reduced to an object.  It can be an object literal, a variable name, or a complex expression. This object is then made available to the method. This is called *object passing.*

The *caller* (or receiver) of a method call- the object on which the method is called, can be thought of as an **implied argument.**

Many operators such as `+`, `*`, `[]`, and `!` are methods and `=` acts like a method. The operands of these operators are arguments, and the operators have return values.

***

### Evaluation Strategy

This strategy determines when expressions are evaluated, and what a method can do with the resulting objects. *Strict evaluation* strategies are the most common strategies and is used exclusively by Ruby. With this strategy, every expression is evaluated and converted to an object before it is passed along to a method.

**Object passing strategies** include pass by value and pass by reference.

***

### Why is this important?

Few languages are pure pass by value or pass by reference. If a method does something that appears to change the object, is that change local to the method or does it result in changes to the original object?

```ruby
def increment(x)
  x << 'b'
end

y = 'a'
increment(y)
puts y
```

- This code will output `ab`. 
- If Ruby is pass by value, then this code would print `a`, since this strategy creates a copy of `y` before passing it to `#increment`.
- If Ruby is pass by reference, then this code would print `ab`. Here Ruby would pass a reference to `#increment`, so `x` becomes an alias for `y`. This means that when you modify `x`, you also modify `y`.

***

### Pass by Value

With pass by value, a copy of an object is created and this copy gets passed around. It is thus impossible to change the original object; any attempt to change it will result in changes to the copy and leaves the original untouched.

Passing around immutable values in Ruby acts a lot like pass by value: 

```ruby
def plus(x, y)
  x = x + y
end

a = 3
b = plus(a, 2)
puts a # 3
puts b # 5
```

- Even though we assigned a new value to `x` in `#plus`, the original argument `a` is left unchanged. 

- The result of adding `2` to `a` is `5` and this is stored in `b`.

- Ruby appears to be pass by value with respect to immutable values.

  

***

### Pass by Reference

A *reference* to an object is passed around with a pass by reference object passing strategy. This establishes an alias between the argument and the original object; both the argument and object refer to the same location in memory. If the arguments state is modified, then the original object is also modified. 

Ruby appears to use pass by reference when passing mutable objects: 

```ruby
def uppercase(value)
  value.upcase!
end

name = 'William'
uppercase(name)
puts name               # WILLIAM
```

- This will output `WILLIAM`. 
- `name` and `value` are aliases for each other so they are both referencing the same String object in memory.
- When the argument is modified, then the original String can be modified.

***

### References All the Way Down

Ruby's variables don't contain  objects, they are merely references to objects. 

If pass by value is employed for immutable objects, but all variables are references, then what exactly is happening when we pass an immutable object? Let’s run a short test: 

```ruby
def print_id number
  puts "In method object id = #{number.object_id}"
end

value = 33
puts "Outside method object id = #{value.object_id}"
print_id value
```

This is what the code prints: 

```ruby
Outside method object id = 67
In method object id = 67
```

- `number` and `value` reference the same object despite the object being immutable. 
- `value` was not copied. 

***

Things to know: 

- Pass by reference isn't limited to mutating methods.
- A non-mutating method can use pass by reference as well, so pass by reference can be used with immutable objects. 
- There may be a reference passed, but the reference isn't a guarantee that the object can be modified.
-  While we can change which object is bound to a variable inside of a method, we can’t change the binding of the original arguments. We can change the objects if the objects are mutable, but the references themselves are immutable as far as the method is concerned. 
-  Since pass by value passes copies of arguments into a method, ruby appears to be making copies of the references, then passing those copies to the method. The method can use the references to modify the referenced object, but since the reference itself is a copy, the original reference cannot be changed. 
- Ruby passes around copies of the references.
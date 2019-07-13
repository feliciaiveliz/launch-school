## Object Passing in Ruby - Pass by Reference or Pass by Value
This is the last article in the series that explains how Ruby manipulate variables and objects and specifically, how objects are passed around in a ruby program. 
We now have a basic understanding of:
 * how Ruby uses variables to reference objects
 * what mutability and immutability mean
 * what it means for a method to be mutating or non-mutating
 * a mental model that states that ruby appears to use pass by value for immutable objects and pass by reference for mutable objects.
 * assignment doesn't mutate objects but instead binds variables to new objects
 * setter methods and indexed assignment do mutate objects

### What is Object Passing?
A developer needs to know what happens to the original objects passed to or returned from a method. In ruby, nearly everything is an object. When a method is called with an expression as an argument, that expression is evaluated by ruby and reduced to an object. 
The expression can be an object literal, a variable name, or a complex expression. Ruby then makes the object available inside the method. This is called passing the object to the method, or object passing. 
In addition to method arguments, the receiver of a method call- the object on which the method is called, can be thought of as an implied argument. 
Returns values are passed by those methods back to the caller. 
Many operators like +, *, [], and ! are methods and even = acts like a method. 
 * the operands of these operators are arguments and the operators have return values. 

Loose terminology
 * Objects
   * literals
   * named objects (variables and constants)
   * complex expressions
 * Methods
   * methods
   * blocks
   * procs
   * lambdas
   * operators
 * Arguments
   * actual arguments
   * receiver of the method
   * operator operands
   * return value 

### Evaluation Strategies
Every computer language uses an evaluation strategy when passing objects. This determines when expressions are evaluated, and what a method can do with the resulting objects. 
The most common strategies are known as *strict evaluation* strategies. Every expression is evaluated and converted to an object before it is passed along to a method. Ruby uses this exclusively.
Two most common evaluation strategies
 * pass by value (immutable-does not change)
 * pass by reference (mutable-changes)
 
#### Why is the Object Passing Strategy Important?
Most languages that use struct evaluation use pass by value by default. They can use pass by reference when needed. 
Understanding which strategy is used and when is key to understanding what happends to an object that gets passed to a method. 
If the method does something that appears to change the object, is that change local to the method or does it result in changes to the original object?

```
def increment(x)
  x << 'b'
end

y = 'a'
increment(y) => 'ab'
puts y
```
If ruby is pass by value, this code prints 'a' because this strategy creates a copy of 'y' before passing it to #increment. Since it is only a copy, it can't actually modify y.
If ruby is pass by reference then it would print 'ab' because it would pass a reference to 'y' to #increment so 'x' becomes and alias for 'y'. When you modify 'x', you also modify the aliased object 'y'.

#### Pass by Value
With pass by value, a copy of an object is created and it's that copy that gets passed around.
Since it is only a copy, it is impossible to change the original object. Any attempt to change the copy just changes the copy and leaves the original object unchanged.
Passing around immutable values in ruby acts a lot like pass by value:

```
def plus(x, y)
  x = x + y
end

a = 3
b = plus(a, 2)
puts a
puts b
```
A new value is assigned to x, but the original argument is left unchanged. It does return the result of adding 2 to a, 5, which is stored in b. 

#### Pass by Reference
A reference to an object is passed around. This establishes an alias between the argument and the original object: both the argument and object refer to the same location in memory. If you modify the argument's state, you also modify the original object. 
Ruby appears to use pass by reference when passing mutable objects. 

```
def uppercase(value)
  value.upcase!
end

name = 'Felicia'
uppercase(name)
puts name  => FELICIA
```
The method can modify the name String through its alias 'value', so it looks like pass by reference. 

### It's References All the Way Down
Ruby's variables don't contain objects; they are merely references to objects. Even if we pass a literal to a method, ruby will convert that literal to an object, thenm, internally, create a reference to the object. 
If pass by value is employed for immutable objects, but all variables are references, then what happens when we pass an immutable object?

```
def print_id number
  puts "In method object id = #{number.object_id}"
end

value = 33
puts "Outside method object id = #{value.object_id}"
print_id value
```
This prints: 

```
Outside method object id = 67
In method object id = 67
```
'number' and 'value' reference the same object despite the object being immutable. 

### Pass by Reference Value
In a pure pass by reference language, assignment would be a mutating operation. In ruby it isn't because ruby variables and constants aren't objects but are references to objects. Assignment merely changes which object is bound to a particular variable. While we can change which object is bound to a variable inside of a method, we can't change the binding of the original arguments. We can change the objects if the objects are mutable, but the references themselves are immutable as far as the method is concerned. 
This sounds like pass by value since pass by value passes copies of arguments into a method. Ruby appears to be making copies of the references, then passing those copies to the method. The method can then use the references to modify the referenced object, but since the reference itself is a copy, the original reference cannot be changed. 
Ruby is a blend of the two strategies.


## Variable References and Mutability of Ruby Objects
This is the first of three articles that explain how Ruby manipulates variables and objects, and specifically how objects are passed around in a Ruby program. More important than the answer to the question of whether Ruby is pass by value or pass by reference, is the understanding of how Ruby works. It will help to anticipate what Ruby will do, when it will do it, and why it will do it. This will help reduce the number of bugs due to unexpected behaviors.

### Introduction
Simple concept: take an object in Ruby and assign it to a variable. That variable now can be used to access and manipulate the variable.

### Variables and References
An object is a bit of data that has some sort of state- a value- and associated behavior. 
Objects can be assigned to variables: 
``` 
>> greeting = 'Hello'
=> "Hello"
```
1. Tells Ruby to associate the name 'greeting' with the String object whose value is "Hello". 
2. 'greeting' is said to *reference* the String object. 
3. Variable is *bound* to the String object, or binding variable to the String object.
4. It does this by storing the object id of the String.

```
>> greeting
=> "Hello"

>> greeting.object_id
=> 70101471431160
```
*Every object in Ruby has a unique object id, and that id can be retrieved by calling #object_id on the object.*

```
>> howdy = greeting
=> "Hello"

>> greeting
=> "Hello"

>> howdy
=> "Hello"

greeting.object_id
=> 70101471431160

howdy.object_id
=> 70101471431160
```
1. Both 'greeting' and 'howdy' reference a String with the same value
2. They are referencing the same String
3. 'greeting' and 'howdy' are aliases for each other.
4. Since both variables are associated with the same object, using either variable to alter the object is reflected in the other variable. 
5. The object id doesn't change.

### Reassignment
Reassigning a new object to one of the variables:

```
>> greeting = 'Dude!'
=> "Dude!"

>> puts greeting
=> "Dude!"

>> puts howdy
=> "HELLO!"

>> greeting.object_id
=> 70101479528400

>> howdy.object_id
=> 70101471431160
```
1. 'greeting' and 'howdy' no longer refer to the same object
2. They have different values and different object ids.
3. Reassignment to a variable doesn't change the object reference by that variable
4. Instead the variable is bound to a completely new object- made to reference a new object
5. The original object is disconnected from the variable. 

### Mutability
Objects can either be mutable or immutable. Mutable objects can be changed while immutable object cannot.
Understanding mutability of an object is necessary to understanding how your language deals with those objects.

#### Immutable Objects
In Ruby, numbers and boolean values are immutable. Once an immutable object is created, it cannot be changed. 
+= creates a brand new object.

```
>> number = 3
=> 3

>> number
=> 3

>> number = 2 * number
=> 6

>> number
=> 6
```
#### Mutable Objects
Most objects in Ruby are mutable. They are objects of a class that permit modification of the object's state in some way.

```
a = %w(a b c)
=> ['a', 'b', 'c']

a.object_id
=> 70227178642840

a[1] = '-'
=> "-"

a 
=> ['a', '-', 'c']

a.object_id
=> 70227178642840
```
1. We can modify the value of a, but it doesn't create a new object since the object id remains the same.
2. 'a' is a reference to an Array, and this Array contains three elements that are referencing a String object. When we assign '-' to a[1], we are binding a[1] to a new String; we're modifying a, but not a[1].

#### Brief Introduction to Object Passing
When you pass an object as an argument to a method, the method can either modify the object or leave it unmodified.
The ability to modify arguments depends in part on the mutability or immutability of the object represented by the argument, but also on how the argument is passed to the method.
Some languages make copies of method arguments and pass those copies to the method. Objects passed this way are said to be *passed by value* and the language is said to be using a *pass by value* object passing strategy.
Other languages pass references to the method instead- a reference can be used to modify the original object, if the object is mutable. Objects passed this way are said to be *passed by reference* and the language is said to be using a *pass by reference* object passing strategy.

### Developing a Mental Model
Pass by value means copying the original objects, so the original object cannot be modified. Since immutable objects cannot be changed, they act like Ruby passes them around by value. (Since they cannot be modified). 

```
def increment(a)
  a = a + 1
end

b = 3
puts increment(b) # prints 4
puts b # prints 3
``` 
3 is immutable. B is not modified by #increment since b is passed by value to #increment where it is bound to a variable a. Even though a is set to 4 inside the method, and returned to the caller, the original object referenced by b is untouched.
Mutable objects can always be modified by calling one of their mutating methods. They act like Ruby passes them around by reference' it isn't necessary for a method to modify an object that is passed by reference, only that is can modify the object.

```
def append(s)
  s << '*'
end

t = 'abc'
puts append(t) # prints abc*
puts t # prints abc*
```
The String object 'abc' is mutable. 't' is modified by #append since t is passed by reference to #append where it is bound to variable 's'. When 's' is modified by append, it modifies the same object referenced by 't', so upon return from the method, 't' still refers to the original (modified) String object.



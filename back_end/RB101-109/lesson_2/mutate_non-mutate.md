# Mutating and Non-Mutating Methods in Ruby
This articles discusses how Ruby manipulates variables and objects and specifically, how objects are passed around in a program. Variables don't actually contain values, but instead serve as references to objects. 

### Methods
Methods can either be mutating or non-mutating. Mutating methods change something, non-mutating methods do not. The object that may or not be mutated is of concern when discussing whether a method is mutating or non-mutating. 
The method String#sub! is mutating with respect to the String receiver object, but non-mutating with respect to its other arguments. 
The receiver itself is a method argument.

*The *receiver* of a method call is the object on which the method is called. For example: in foo.upcase, the receiver is foo.

#### Non-Mutating Methods
A method is said to be non-mutating with respect to an argument(including its receiver) if it does not modify that argument. Most methods do not mutate their arguments or receiver. Some mutate their receiver, but few mutate any other arguments. 
All methods are non-mutating with respect to immutable objects. A method simply can't modify an immutable object. Any method that operates on numbers and boolean values is guaranteed to be non-mutating with respect to that value.

#### Assignment is Non-Mutating
Assignment merely tells Ruby to bind an object to a variable with '='. This means that assignment does not change an object, it just connects the variable to a new object.
'=' is not an actual method in Ruby, but it acts like a non-mutating method.

```
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
``` 
1. It is passing 's' to 'fix'; this binds the String represented by "hello" to value. 's' and 'value' are now aliases for the String.
2. #upcase! converts the String to uppercase. 's' and 'value' now contain "HELLO"
3. #concat is called on the value, which also modifies value instead of creating a new String; the String now has a value of "HELLO!" and both s and value referece that object.
4. It returns a referece to the String and stores it in 't'.
5. Use object_id in irb to check code to see if two objects are the same

```
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```
1. The return value of value.upcase is assigned back to 'value'. 
2. Unlike #upcase!, #upcase doesn't modify the String referenced by 'value'; instead it creates a new copy of the String referenced by 'value', modifies the copy, and then returns a reference to the copy.
3. Then it binds 'value' to the returned reference.
4. 's' and 't' now reference two different objects. 


Operations prior to the assignment may still take place:

```
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end
s = 'hello'
t = fix(s)
```

1. 's' and 'value' are aliases for each so they both reference the same object whose value is the string "hello"
2. It modifies the original string so its value is 'helloxyz'.
3. When it came to the reassignment, it didn't change to HELLOXYZ or HELLOXYZ! because those changes occur in a different object that gets returned by the method.

```
s = 'Hello'
"Hello"

s.object_id
70101471465440

s += ' World'
"Hello World"

s 
"Hello World"

s.object_id
70101474966820
```
1. It looks like 's' is being modified when we write 's += ' World'
2. It's not. It is creating a brand new String with a new object id, then binding it to that new object. 
3. Setter methods and indexed assignment usually mutate their receiver

#### Mutating Methods
A method is said to be mutating with respect to an argument or receiver if it modifies the argument or receiver.

```
>> s = '    hey    '
=> "    hey    "

>> s.object_id
=> 70101479494960

>> s.strip!
=> "hey"

>> s.object_id
=> 70101479494960
```

1. It mutates the original String object; 's' references the same object both from before and after #strip is called. Only the state of the object has been changed.
2. Many methods mutate their receiver and use a ! at the end but not always.
3. String#concat is a mutating method but does not include a '!'

### Indexed Assignment is Mutating
Such that is used by String, Hash, and Array objects can be confusing:

```
str[3] = 'x'
array[5] = Person.new
hash[:age] = 25
```
1. This looks exactly like assignment, which is non-mutating, but is mutating.
2. #[] modifies the original object(String, Hash, or Array).
3. It doesn't change the binding of each variable.

```
def fix(value)
  value[1] = 'x'
  value
end

s = 'abc'
t = fix(s)
p s             # "axc"
p t             # "axc"
p s.object_id   # 70349153406320
p t.object_id   # 70349153406320
```

1. Before, we performed assignment to bind value to a new String. 
2. Using indexed assignment, binding does not change. Even after assignment to value[1], value still references the same (mutated) String object.
3. Index assignment is a method that a class must supply if it needs indexed assignment. 
4. It is called #[]= and is expected to mutate the object to which it applies. It does not create a new object.

```
a = [3, 5, 8]
=> [3, 5, 8]

>> a.object_id
=> 70240541515340

>> a[1].object.id_
=> 11

>> a[1] = 9
=> 9

>> a[1].object_id
=> 19

>> a
=> [3, 9, 8]

>> a.object_id
=> 70240541515340
```
1. We mutated the array 'a' by assigning a new value to a[1], but have not created a new array.
2. a[1] isn't assigning anything to 'a'; it is assigning 9 to a[1]
3. Meaning, that this assignment changes a[1] so that it references the new object '9'. 
4. Look at a.object_id before and after the assignment. 
5. 'a' itself still points to the same (now mutated) array we started with. 
6. This is normal behavior when working with objects that support indexed assignment: the assignment does cause a new reference to be made, but it is the collection element (a[1]) that is bound to the new object, not the collection (enclosing object) itself. 

#### Concatenation is Mutating
The #<< method used by collections like Arrays and Hashes, as well as the String class, implements concatenation; this is similar to += operator.
There is a major difference, += is non-mutating, but #<< is mutating with respect to its receiver.
Ex: s << 'meow' - s is the receiver. The << operator is actually a method that is defined for some classes. It is usually used as a shorthand for appending new values to a collection or String. Such classes define << to mutate their left-hand operand. (receiver object)

#### Setters are Mutating
Setters are very similar to indexed assignment; they are methods that are defined to modify the state of an object. Both employ the something = value syntax, so they look like assignments. With indexed assignment, the elements of a collection (or characters of a String) are replaced. With setters, the state of the object is modified, usually by modifying an instance variable. 

Setter invocation:

```
person.name = 'Felicia'
person.age = 25
```
1. This mutates the object bound to 'person'




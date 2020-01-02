# Variable References and Mutability of Ruby Objects

### Variables and References

##### Objects can be assigned to variables: 

```ruby
>> greeting = "Hello"
=> "Hello"

>> greeting.object_id
=> 70101471431160
```

- On `line 1` local variable `greeting` is being initialized and assigned to String object with a value of `hello`. `greeting` is now referencing the String object.
- It does this by storing the object id of the string.
- The String object represented by the literal "Hello" is assigned to a variable that has the name `greeting`.

***

##### All objects have a unique object id:

```ruby
>> 5.object_id
=> 11

>> true.object_id
=> 20

>> nil.object_id
=> 8

>> "abc".object_id
=> 70101471581080
```

***

##### We can assign a variable to reference the same object that another variable is pointing to: 

```ruby
>> welcome = greeting
=> "Hello"

>> greeting
=> "Hello"

>> welcome
=> "Hello"

>> greeting.object_id
=> 70101471431160

>> welcome.object_id
=> 70101471431160
```

- The object ids for both variables are the same.
- `greeting` and `welcome` are both referencing a String with the same value, and in fact are referencing the same string
- `greeting` and `welcome` are aliases for each other

***

##### We can use either one of these variables to change the object: 

```ruby
>> greeting.upcase!
=> "HELLO"

>> greeting
=> "HELLO"

>> welcome
=> "HELLO"

>> welcome.concat('!')
=> "HELLO!"

>> greeting
=> "HELLO!"

>> welcome
=> "HELLO!"

>> greeting.object_id
=> 70101471431160

>> welcome.object_id
=> 70101471431160
```

- Both variables are associated with the same object, therefore using either one to change the object is reflected in the other variable. 
- The object id does not change in this case as the original String object is not mutated.

***

#### Reassignment

```ruby
>> greeting = 'Dude!'
=> "Dude!"

>> puts greeting
=> "Dude!"

>> puts welcome
=> "HELLO!"

>> greeting.object_id
=> 70101479528400

>> welcome.object_id
=> 70101471431160
```

- `greeting` and `welcome` no longer reference the same String object
- They have different values and different object ids
- Reassignment to a variable doesn't change the object referenced by that variable, it instead is bound to a completely new object. 
- The original object is disconnected from the variable.
- `greeting` is bound to the String object whose value is `Dude!`
- `welcome` continues to reference the String object whose value is `HELLO!`.

***

### Mutability

Objects can either be mutable or immutable. 

Mutable objects can be changed.

Immutable objects cannot be changed.

#### Immutable Objects

Numbers and Boolean values are **immutable**. 

```ruby
>> number = 3
=> 3

>> number
=> 3

>> number = 2 * number
=> 6

>> number
=> 6
```

- This is **reassignment**, which means that the object doesn't change. 
- A new number object is bound to the variable `number`.
- There are no methods available to let you alter the value of an immutable object. 
- You can only reassign the variable so it references a different object. 
- This disconnects the original object from the variable. 

***

##### Demonstration

```ruby
>> a = 5.2
=> 5.2

>> b = 7.3
=> 7.3

>> a
=> 5.2

>> b
=> 7.3

>> a.object_id
=> 46837436124653162

>> b.object_id
=> 65752554559609242
```

- We initialize variables `a` and `b` to Float values `5.2` and `7.3`. 
- The object ids are different, so the variables reference different objects

What happens if we assign `b` to `a`?

```ruby
> a = b
=> 7.3

>> a
=> 7.3

>> b
=> 7.3

>> a.object_id
=> 65752554559609242

>> b.object_id
=> 65752554559609242
```

- Both variables are now referencing the same Float object, `7.3`. 
- The object that held the value of `5.2` is now gone.

What happens if we try to change the object? 

```ruby
>> b += 1.1
=> 8.4

>> a
=> 7.3

>> b
=> 8.4

>> a.object_id
=> 65752554559609242

>> b.object_id
=> 32425917317067566

```

- We try to change the object referenced by `b` by incrementing `b` by `1.1`. 
- `a` is not modified so it still references the `7.3` object. 
- `b` now references a **new** object. 
- We changed the value associated with `b`, but we didn't modify the object since it is **immutable**.
- `+=` created a brand-new Float object and bound variable `b` to the new object.

Assignment doesn't change an immutable object: 

```ruby
>> a = 5.5
=> 5.5

>> a.object_id
=> 49539595901075458
```

- Instead of modifying the original object, a new Float object is created and `a` is now bound to it.

Immutable objects also include objects of some other classes such as `nil` and Range.

***

### Mutable Objects

Most objects in Ruby are mutable; they are objects of a class that permit modification of the object's state in some way.

Array objects allow for you to easily modify elements using **indexed assignment**: 

```ruby
>> a = %w(a b c)
=> ["a", "b", "c"]

>> a.object_id
=> 70227178642840

>> a[1] = '-'
=> "-"

>> a
=> ["a", "-", "c"]

>> a.object_id
=> 70227178642840
```

- We can modify the value of `a`, but it doesn't create a new object since the object id is still the same.
- `a` is a reference to an Array object that has its own object id, and each element at positions `a[0]`, `a[1]`, and `a[2]` have their own object ids that reference a different String object.
- When we assign `-` to `a[1]`, we are binding `a[1]` to a **new** string. 

Strings and other collection classes are similar in the way they behave. **Variables reference the collection (or String) and the collection contains references to the actual objects in the collection. **

Several Array methods such as `#delete`, `#fill`, and `#insert` mutate the original object without creating a new one. 

***

### Developing A Mental Model

*Pass by value means copying the original objects so the original object cannot be modified.*

```ruby
def increment(a)
  a = a + 1
end

b = 3
puts increment(b)    # prints 4
puts b               # prints 3
```

- Numeric object `3` is **immutable**. 
- `b` is not modified by `#increment` since `b` is passed by value to `#increment` where it is bound to variable `a`. 

*Pass by reference means that only a reference to an object is passed around; the variables used inside a method are bound to the original objects.*

Mutable objects can always be modified simply by calling one of their mutating methods. 

```ruby
def append(s)
  s << '*'
end

t = 'abc'
puts append(t)    # prints abc*
puts t            # prints abc*
```

- The String object `abc` is mutable. 
- `t` is modified by `#append` since `t` is passed by reference to `#append` where it is bound to the variable `s`. 
- When `s` is modified by `#append`, it modifies the same object referenced by `t`
- `t` still refers to the original (but now modified) String object upon return from the method.
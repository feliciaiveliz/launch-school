# Mutating and Non-Mutating Methods in Ruby

Variables don't actually contain values, but instead serve as references to objects. This set of notes discusses how methods can be mutating or non-mutating with respect to certain arguments.*

Specifically **assignment** and **concatenation**.

***

### <u>Mutating and Non-Mutating Methods</u>

#### Non-Mutating Methods

A method is non-mutating with respect to an argument or its caller if it does not modify it. All methods are non-mutating with respect to immutable (unchangeable) objects. 

#### Assignment is Non-Mutating

This is assignment: `=`. It tells Ruby to bind an object to a variable. It does not change an object; it merely connects the variable to a new object. It is not a method, but it **acts** like a non-mutating method.

```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
```

- We pass `s` to `fix` method, so `s` and `value` are aliases for each other; they are both referencing String object with value of `hello`.
- `#upcase!` method is called, converting the String `hello` by uppercasing it; this is reflected in `s` and `value`. 
- Destructive method call `#concat` appends `!` at the end of the String object that `s` and `value` are referencing, so now the value is `HELLO!`.
- The last line of the code returns a reference to the String of the `fix` method.
- `t` is set to store the reference of the return value of the `fix` method, which is `HELLO!`.
- The only time a new String object is created is when we initialize the `s` local variable to reference that String, but for the rest of the time we are working directly with that String.

***

We can modify this code slightly: 

```ruby
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

Now what are `s` and `t`?

- We pass in `s` as argument to `fix` method so now `s` and `value` are aliases for each other, and they both reference the String object `hello`.
- We assign the return value of `value.upcase` back to the `value` variable. 
- `upcase` does not mutate the original string; it creates a new String object, modifies that string object, returns a reference to that string object and this is what is then bound to `value`.
- The String object that `value` is referencing is `HELLO` and to the object we call `concat` to append a `!` at the end of it.
- `HELLO!` is what is saved into variable `t` because that is the return value of the `fix` method.
- `s` continues to reference `hello` because it was not modified in any way.

***

What are `s` and `t`? 

```ruby
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end
s = 'hello'
t = fix(s)
```

- `s`  is referencing a String object with the value of `helloxyz` and `t` is referencing a different String object with a value of `HELLOXYZ!`

***

#### Reminder: Assignment is Non-Mutating!!

```ruby
>> s = 'Hello'
=> "Hello"

>> s.object_id
=> 70101471465440

>> s += ' World'
=> "Hello World"

>> s
=> "Hello World"

>> s.object_id
=> 70101474966820
```

- We are creating a **new** string object and that object is what gets assigned back to `s`.

What is happening here? 

```ruby
>> def fix(value)
--   value = value.upcase!
--   value.concat('!')
-- end
=> :fix

>> s = 'hello'
=> "hello"

>> s.object_id
=> 70363946430440

>> t = fix(s)
=> "HELLO!"

>> s
=> "HELLO!"

>> t
=> "HELLO!"

>> s.object_id
=> 70363946430440

>> t.object_id
=> 70363946430440
```

- We assigned a reference to `value`, however both `s` and `t` end up referring to the same object. 
- This is because `String#upcase!` returns **a reference** to its caller, `value`.
- Since this reference is the same, although modified, String we started with, the assignment *rebinds* `value` back to the object it was previously bound to; nothing is changed by the assignment.

### *Study this

***

#### Mutating Methods

A method is mutating with respect to an argument or its caller if it modifies it.

```ruby
>> s = '   hey   '
=> "   hey   "

>> s.object_id
=> 70101479494960

>> s.strip!
=> "hey"

>> s.object_id
=> 70101479494960
```

- We mutate the original String object; `s` references the same object both before and after `#strip!` is called. Only the state of object is changed.
- `String#concat` is a mutating object but it doesn't include a `!` at the end of its name. 
- Not all mutating methods use this `!` at the end of their name.

***

What other methods mutate their caller but don't include a `!` at the end of their name? 

- `#[]=`
- `#<<`
- setter methods ** What are setter methods?

***

### Indexed Assignment is Mutating

String, Array and Hash objects use indexed assignment.

```ruby
str[3] = 'x'
array[5] = Person.new
hash[:age] = 25
```

- `#[]` modifies the original object (String, Array or Hash).
- This is a mutating action.
- Does not change the binding of each variable.

Consider this code: 

```ruby
def fix(value)
  value[1] = 'x'
  value
end

s = 'abc'
t = fix(s)
p s            # "axc"
p t            # "axc"
p s.object_id  # 70349153406320
p t.object_id  # 70349153406320
```

- The binding of `s` and `t` does not change; indexed assignment is performed on the original (now modified) String object.

Example with an Array: 

```ruby
>> a = [3, 5, 8]
=> [3, 5, 8]

>> a.object_id
=> 70240541515340

>> a[1].object_id
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

- We have mutated Array `a` by assigning a new value to `a[1]`, but we did not create a new array.
- This indexed assignment changes `a[1]` so that it references a new object, `9`.
- The object id of `a[1]` can be checked before and after the assignment to show that it indeed references a new object.
- Despite `a[1]` being modified, Array `a` still references the same (now mutated) Array that we began with.
- **Indexed assignment does cause a new reference to be made, but it is the collection element (`a[1]`) that is bound to the new object, not the collection (`a`, enclosing element) itself.**

***

### Concatenation is Mutating

The `#<<` and `#+=` both implement **concatenation**, however there is a huge difference: 

- `#<<` method is mutating
- `#+=` operator is non-mutating
- These are used by Array and Hash collection and by the String class

Example: 

```ruby
>> s = 'Hello'
=> "Hello"

>> s.object_id
=> 70101471465440

>> s << ' World'
=> "Hello World"

>> s
=> "Hello World"

>> s.object_id
=> 70101471465440
```

- The `#<<` method here is mutating with respect to its caller (`s`) so the object referenced by `s` is modified.
- No new objects were created.
- The `<<` operator is a method that is defined for some classes that is used as a shorthand for appending new values to a collection or String.
- These classes define `<<` to mutate their left-hand operand (caller).

***

### Setters are Mutating

Setters are similar to indexed assignment; they are **methods that are defined to modify the state of an object.** Both use `something = value` syntax so they look like assignments.

With indexed assignment, the elements of a collection (or the characters of a String) are replaced.

With setters, the state of the object is modified, usually by modifying an instance variable.

Setter invocation looks like this: 

```ruby
person.name = 'Bill'
person.age = 23
```

- This looks exactly like assignment, which is non-mutating, but these are setter calls, which mutate the object bound to `person`.
- It's possible to define setter methods that don't mutate the original object. These should be treated as mutating since they don't create new copies of the original object.

***

### Refining Mental Model

The fact that Ruby can have methods that mutate its arguments would seem to say that Ruby uses **pass by reference** in some circumstances. Arguments that are **passed by copy** cannot be mutated.

Methods that end with `!` usually indicate that that method can mutate its caller, however not all mutating methods use this convention. Certain operations like **setters** and **indexed assignment** should always be treated as mutating methods. Others like **assignment** and the **assignment operators** (`#+=`, `#*=`) are always non-mutating.

Immutable objects seem to be passed by value and mutable objects seem to be passed by reference. Assignment can break the binding between an argument name and the object it references. 
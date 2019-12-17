# Beginner Ruby Video Notes - Part 2

***

#### What does this output? 

```ruby
def amethod(param)
  str += " world"
end

str = "hello"
amethod(str)

p str
```

- This code generates an error because `str` is not available within the method. `str` doesn't exist in the method as it is initialized in the outer scope. Method definitions create their own scope.

- How do I describe this?

***

#### What will this output?

```ruby
def amethod(param)
  param += " world"
end

str = "hello"
amethod(str)

p str
```

- This code will print `hello`.

- The code on `line 2` will return a new String object because `+=` is reassignment, and it does not mutate the original String object.

***

#### What will this output?

```ruby
def amethod(param)
  param << " world"
end

str = "hello"
amethod(str)

p str
```

- This code will print "hello world". `<<` is a mutating method that appends the String object on the right of it to the String object to the left of it. `str` is modified in this case.

***

#### What is happening in this code? 

```ruby
def amethod(param)
  param += " world"
  param + " world"
  param << " world"
end

str = "hello"
amethod(str)

p str
```

- The code on `lines 2-3` will not have a permanent effect on `str`.
- The code on `line 4` will have a permanent effect on `str` local variable.
- `line 2` is reassignment and is shorthand for `param = param + world`.
- `line 3` is string concatenation and it returns a new String object. It is not an operator, it is a method call to `String#+`. It is shorthand for `param.+(" world")`. (plus method call)
- On `line 4` we invoke destructive method call `<<` on object `param` local variable is referencing, which permanently mutates that object. 

***

#### What is output here and why? 

```ruby
def amethod(param)
  param + " universe" # ignored, since new string is not saved. There is no change to param.
  param << " world" # returns mutated original string.
end

str = "hello"
amethod(str)

p str
```

- This code will print out `hello world` because `line 3` has a permanent effect on `param`. Since the result of the new concatenated string is not being saved in a variable, it is ignored.

***

#### What is output here?

```ruby
def amethod(param)
  param += " universe" # reassignment to param variable as new string object
  param << "world" 
end

str = "hello"
amethod(str)

p str
```

- This code will return `hello`. 

***

#### What is an appropriate mental model for this code example? 

```ruby
a = "hello"
b = a
```

- There are two variables and one object. 
- These two local variables are pointing to the same object. 
- Variables point to objects. 
- Objects are things that live in memory.
- This is two variable initializations. 
- `a` is being initialized to String object with value `hello`.
- `b` is being initialized to same String object that local variable `a` is pointing to. 

***

#### What is output here?

```ruby
a = "hello"
b = a

b << " world"

puts a
puts b
```

- `line 6` will output "hello world".
- `line 7` will output "hello world"
- On `line 1` we are initializing local variable `a` and assigning it to String object with value `hello`.

- On `line 2` we are initializing local variable `b` and assigning it to the same String object local variable `a` is pointing to.
- On `line 4` we invoke destructive method call `<<` on String object local variable `a` and `b` are referencing, appending String object `world` to it. 
- We output value of local variable `a` on `line 6`, which is `hello world`
- We output value of local variable `b` on `line 7`, which is also `hello world`. 

***

#### What is output here?

```ruby
a = "hello"
b = a

b << " world"

puts a
puts b

a = "hey"
b << " universe"

puts a
puts b
```

- `line 12` outputs `hey`
- `line 13` outputs `hello world universe`

- There are now two variables and two objects
- `line 9` is reassignment; local variable `a` is now referencing a new String object `hey`.
- On `line 10` we invoke destructive method call `<<` on String object local variable `b` is referencing, appending String object `universe` to it.
- local variable `a` is referencing a whole new string object while local variable `b` is still referencing the `hello world` string object.

***

#### Describe what is happening in the code below: 

```ruby
def amethod(param)       # param = str
  param += " universe"   # param = param + " universe"
  param << " world"
end

str = "hello"
amethod(str)

p str
```

- We define method definition called `amethod` that takes one parameter, `param`.
- On `line 1` we initialize `amethod` local variable `param`.
- On `line 8` we pass local variable `str` into `amethod` method as argument.
- On `line 1` `param` is assigned to `str`; they are now aliases for each other as they both reference the same string object with value of `'hello'`.
- On `line 2` we reassign `param` to a new String object. Now `param` variable is not pointing to the same object as `str`.
- On `line 3` we invoke destructive method call `<<` on String object local variable `param` is referencing, appending string object with value `world` to it.
- On `line 9` we invoke `p` method and pass in `str` local variable to it to output its value, which is `hello`.

***

#### What is happening in this code below?

```ruby
def prefix(str)
  "Mr. " + str
end

name = 'Joe'
prefix(name)

puts name
```

- This will print out `Joe`. 

- On `line 2` we use string concatenation by prepending `Mr.` to `str`, thereby creating a new String object. 
- This new String object created on `line 2` is not captured into a variable to be used by the method.
- We invoke `puts` method on `line 8` and pass in `name` argument to it, which is `Joe`. This is because the return value of the `prefix` method is not used. 


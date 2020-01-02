# Beginner Ruby Video Notes - Part 1

Notes will cover: 

- reading Ruby's syntactical sugar
- where does the code come from?
- variable scope
- pass by reference and pass by value
- questions

***

45:07

In Ruby, parentheses are optional.

```ruby
puts "Hello"
```

- This is method invocation.
- Since parentheses are optional, you don't need it for code like this.
- We are passing in a string as an argument to this method to output its value.

You could write this code like this: 

```ruby
puts("Hello")
```

***

Consider this example of syntactical sugar: 

```ruby
def str
  "a method"
end

p str
```

- Are we referencing a local variable or invoking a method?
- We are printing out the return value of this method invocation.

```ruby
str = "a string"

p str
```

- Now we are printing out the value of the `str` variable.

***

Suppose we had both a local variable and a method invocation: 

```ruby
str = "a string"

def str
  "a method"
end

p str
```

- Here, it will reference the local variable. 
- In order to invoke the method definition, you need to put it parentheses

```ruby
str = "a string"

def str
  "a method"
end

p str()

# or can be written:

p( str() )

# this would be referencing a local variable

p( str )
```

***

```ruby
puts "Hello"
```

- `puts` method lives in the Kernel Module. 
- This code can be written as `Kernel.puts("Hello")`
- In this code we invoke the `puts` method and pass in an argument, in this case the String object with a value of `Hello`.

***

```ruby
arr = [1, 2, 3, 4]

sum = 0
counter = 0

loop do 
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end
```

- Local variable scoping rules: local variables initialized in the outer scope can be accessed in an inner scope. 
- `loop do...end` constitutes a block. 
- `sum` and `counter` are available in the inner scope within a block because they are initialized in the outer scope

***

Can we access this `str` variable within the block?

```ruby
str = "hello"

loop do 
  puts str
  break
end
```

- Yes, local variable `str` is initialized in the outer scope therefore it is accessible in the inner scope within the `do...end` block alongside the `loop` method invocation.

What is the output here?

```ruby
str = "hello"

loop do 
  str = "world"
  break
end

puts str
```

- `world`. This is because `str` is being *reassigned* in the inner scope created by the `do...end` block. `str` now references the String object with value of `hello` and this is what is output to the screen.

What is output here?

```ruby
loop do 
  str = "world"
  break
end

puts str
```

- `str` is being *initialized* in the inner scope within the `do...end` block and therefore will not be accessible to the outer scope. This will raise an `undefined local variable or method 'str'` exception.
- The syntax looks exactly the same as assignment but they are very different.
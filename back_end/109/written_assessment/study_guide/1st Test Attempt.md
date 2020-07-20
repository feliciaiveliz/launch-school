```ruby
def greeting
  puts "Hello"
end
```

From lines 1-3 we are defining a method called `greeting`. 

Within this method definition, we invoke the `puts` method and pass in a string object with a value of `hello` to it. 

This method definition `greeting` outputs the string object `hello` and returns `nil`. 

This code example demonstrates a simple method definition that outputs a value of a variable and returns something, in this case `nil`. 

***

```ruby
[1, 2, 3].each { |num| puts num }
```

From `lines 1-3` we are invoking the `Array#each` method on the array object `[1, 2, 3]`. We pass the `{}` to `each` as an argument. This defines a block and creates an inner scope.

From within the scope of this method invocation, we pass the block a parameter `|num|`. This local variable represents the element at the current iteration and is what the element is assigned to when it gets passed into the block.

On line 2 we invoke the `puts` method and pass in local variable `num` to it as an argument, which outputs the current element of the array for each iteration. 

This method invocation with a block outputs `1`, `2`, and `3` on their own lines, and this returns the original calling object, `[1, 2, 3]`. The return value of the block on each iteration is `nil`, however `Array#each` does nothing with the return value of the block; it just returns the calling object. 

***

```ruby
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting
```

On `line 1` we initialize local variable `greeting` in the outer scope and set it to reference a String object with a value of `Hello`.

On `lines 1-3` we invoke the `loop` method invocation and pass in the `do..end` block to it as an argument. This defines a block and creates an inner scope.

From within the method invocation, we reassign local variable `greeting` and set it to reference a different string object with a value of `Hi`. This is possible because the variable was initialized in the outer scope, making it available in the inner scope for reassignment.

The `break` statement on line 5 is necessary to prevent an infinite loop.

On line 8 we invoke the `puts` method and pass in `greeting` to it as an argument, outputting it's new value `Hi` since it has been reassigned. This line outputs `nil`. 

This example demonstrates local variable scoping rules, specifically the fact that a local variable initialized outside of a block in the outer scope is accessible inside the block in an inner scope. This allows us to make changes to it. 

***

```ruby
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```

On `line 1` we initialize local variable `a` in the outer scope and set it to reference a String object with a value of `hello`.

The code enters an if/else conditional statement. Since `a` evaluates to `true` in the conditional statement, the `if` branch of code gets executed.  We invoke the `puts` method on line 4 and pass in a string object with a value of `Hello is truthy` to it as an argument to output its value. This is what is output, and `nil` is returned. 

***


### Code Snippets and Detailed Explanations of Concepts


How would you describe this code? 
```ruby
a = 'hello'
b = a
a = 'goodbye'
```

On `line 1` we are initializing local variable `a` to the String object whose value is `'hello'`.

On `line 2` we are initializing local variable `b` and assigning to it a String object that local variable `a` is also referencing. Currently both local variables are referencing the same object. 

On `line 3` we are reassigning local variable `a` to a different String object with the value `goodbye`. Now, local variable `a` is pointing to one String object with value `goodbye` and the local variable `b` is pointing to a string object with the value `hello`.

***
How would you describe this code? 

```ruby
def example(str)
  i = 3
  loop do 
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')
```

On `line 1-8` we are defining the method `example` which takes 1 parameter. On `line 10` we are invoking the method `example` and passing in the string `hello` as an argument to it. 

On `line 2` of this code we are initializing local variable `i` to the Integer object with the value of `3`. 

On `line 3` we are invoking the method `loop` and passing in the `do...end` block as an argument to it.

On `line 4` we are invoking the `puts` method and passing in local variable `str` to it as an argument.

On `line 5` we are reassigning local variable `i` with `-=`. `i` will be decremented by `1` on each iteration and that return value will be reassigned back to `i`. 

On `line 6` we are breaking out of the loop using keyword `break` if the value of the object that local variable `i` is referencing is equal to 0. 

On `line 10` we are invoking the method `example` and passing in the string `hello` as an argument.

Finally, this code **outputs** the string `hello` 3 times and **returns** `nil`. This is because `puts str` is the last evaluated line of code in the method `example`.

***
What will this code output and why? 

```ruby
a = 4

loop do 
  a = 5
  b = 3
  break 
end

puts a
puts b
```

On `line 53` we are initializing local variable `a` to Integer object 4.

On `lines 55-59`, the `do..end` block alongside the `loop` method creates an inner scope.

Within the loop, we reassign local variable `a` to a different Integer 5, and we initialize local variable `b` to Integer 3. 

On `line 58` the `break` keyword is used to stop execution after one iteration.

On `line 61` we invoke the `puts` method to output the value of local variable `a`, which is 5.

On `line 62`we invoke the `puts` method and pass in local variable `b` to it and output its value, which raises an exception undefined local variable or method `b`.

This code example demonstrates local variable scoping rules and specifically the fact that local variables initialized in the outer scope can be accessed in an inner scope, however local variables that are initialized in an inner scope cannot be accessed by the outer scope. 

*** 

What will be output and why? 

```ruby
a = 4
b = 2

loop do 
  c = 3
  a = c
  break 
end

puts a
puts b
```

On `line 84` we are initializing local variable `a` to Integer with a value of `4`.

On `line 85` we are initializing local variable `b` to Integer with value of `2`.

On `line 87` we invoke the `loop` method and pass in the `do...end` block to it as an argument. Within this block we initialize a new local variable `c` and assign it to Integer with value of `3`. This local variable is scoped within the block's inner scope. 

On `line 89` we reassign local variable `a` to reference the same object that local variable `c` is referencing. Local variable `c` is accessible due to the fact that we are still in the inner scope that's defined by the block. 

On `line 90` we use keyword `break` to stop execution after one iteration. 

On `line 93` we invoke `puts` method and pass in local variable `a` as an argument to output its value, which is `3` now since it was reassigned within the block. 

On `line 94` we invoke `puts` method and pass in local variable `b` as an argument to output its value, which is `2` since it is available to outer scope. 










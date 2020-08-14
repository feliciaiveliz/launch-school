# Study Guide Code Examples

 Examine the code example below. The last line outputs the String `'Hi'` rather than the String `'Hello'`. Explain what is happening here and identify the underlying principle that this demonstrates. 

```ruby
greeting = "Hello"

loop do 
  greeting = "Hi"
  break
end

puts greeting
```

- On `line 1` we initialize local variable `greeting` and assign to String object with a value of `Hello`. `greeting` now references this object.
- On `line 3-6` we invoke a `loop` method invocation and the `do...end` alongside it defines a block, and therefore an inner scope. 
- On `line 4`, local variable `greeting` is reassigned to a different String object with a value of `Hi`.
- On `line 5`, `break` keyword is used to stop execution after one iteration.
- On `line 8` we invoke `puts` method and pass in `greeting` variable to it as an argument, outputting its value, which is `Hi`. 
- This code demonstrates local variable scoping rules, specifically that local variables initialized in the outer scope can be accessed within an inner scope. Since `greeting` was initialized outside of the `loop` method invocation with a block, it was available within the block to be reassigned to a different object.

***

```ruby
def a_method
 puts "Hello World"
end
```

- On `line 1` we define `a_method` method definition.
- On `line 2` we invoke `puts` method and pass in String object with a value of `Hello World` to it as argument to output its value.
- This method outputs the string `Hello World` and returns `nil` from the method definition.

***

In Ruby, every value apart from `false` and `nil` *evaluates* to *`true`* in a boolean context. Every value apart from `false` and `nil` is *truthy*, while `false` and `nil` are *falsey*. 

```ruby
a = "Hello"

if a 
  puts "Hello is truthy"
else 
  puts "Hello is falsey"
end
```

- On `line 1` we initialize local variable `a` and set it to reference String object with a value of `Hello`.
- On `lines 3-7`, we enter a conditional `if/else` statement. 
- Local variable `a` is `truthy` in the conditional statement, so `Hello is truthy` is output. 
```ruby
def say(words)
  puts words
end

say("hello")
say("hi")
say("how are you")
say("I'm fine")
```

- On `line 1` we define method definition `say` method and pass in parameter `words`, which is a variable local to this method.
- Since `words` local variable is scoped at the method definition level, we cannot reference this outside of the method.
- When we pass in an argument to the method, that word or string is assigned to local variable `words` to be used within the method definition.
- Method definitions create their own scope outside the regular flow of execution.
- Local variable within a method definition cannot be referenced from outside of the method definition. 
- Local variables within a method definition cannot access data outside of the method definition unless the data is passed in as a parameter. 
- On `line 2` we invoke `puts` method and pass in `words` as an argument to output its value
- On `line 5` we invoke `say` method and pass in String object with a value of `hello` as an argument. 
- On `line 6` we invoke `say` method and pass in String object with a value of `hi` as an argument. 
- On `line 7` we invoke `say` method and pass in String object with a value of `how are you` as an argument. 
- On `line 8` we invoke `say` method and pass in String object with a value of `I'm fine` as an argument. 
- The `say` method definition outputs each String object when the method is invoked by returns `nil` every time it is invoked. 

***

```ruby
a = 5

def some_method
  a = 3
end

puts a
```

- The value of `a` is `5`.
- Method definitions create their own scope that's outside the execution flow.
- We define `some_method` method definition on `line 3`.
- On `line 4` local variable `a` is initialized and assigned to integer object with value of `3`.
- On `line 7` we invoke `puts` method and pass in local variable `a` as argument to output its value, which is `5`. 
- This is because local variable `a` is not accessible within the method, therefore it cannot be reassigned or used in any way within the `some_method` method definition. 
- Since it is scoped in the outer scope and not passed in as a parameter to `some_method`, it cannot be used within it.

***

```ruby
[1, 2, 3].each do |num|
  puts num
end
```

- This is an example of method invocation with a block. 
- We invoke `each` method on Array object `[1, 2, 3]`. 
- The `do...end` alongside the `each` invocation defines a block and creates an inner scope and acts as an argument to the `each` method.
- We pass in `|num|` parameter to the `do...end` block.
- On each iteration, every element of the array is passed to the block and assigned to local variable `|num|` parameter, which then is output by the code within the block: `puts num`. 
- `1`, `2`, `3`, is output on each iteration and `nil` is returned on each iteration. 

***

```ruby
def print_num(num)
  puts num
end
```

- On `line 1` we define `print_num` method definition and pass in parameter `num` to it.
- On `line 2` we invoke `puts` method and pass in `num` to it as an argument to output its value.
- This method definition `print_num` will output the value of `num`, but will return `nil`.

***

The `some_method(obj)` format is when you send arguments to a method call. `obj` is passed in to the `some_method` method. 

***

```ruby
def some_method(number)
  number = 7
end

a = 5
some_method(a)
puts a
```

- On `line 1` we define `some_method` and pass in `number` parameter to the method definition.
- In `some_method`, the value of `a` is assigned to local variable `number`. 
- Local variable `a` and parameter `number` are aliases for each other. 
- On `line 2` we reassign `number` local variable to integer object with a value of `7`.
- On `line 5` we initialize local variable `a` and assign it to integer object `5`. `a` now references integer object `5`.
- On `line 6` we invoke `some_method` and pass in local variable `a` as argument.
- On `line 7` we invoke `puts` method and pass in local variable `a` as argument to output its value, which is 5. 

***

```ruby
a = [1, 2, 3]

def mutate(array)
  array.pop
end

p mutate(a)
```

- On `line 1` we initialize local variable `a` and set it to reference an array of integers, `1`, `2`, `3`.
- On `line 3` we define `mutate` method and pass in local variable `array` as a parameter to the method definition.
- The value of `a` is assigned to local variable `array`, so now both `a` and `array` are aliases for each other and are referencing the same array object, `[1, 2, 3]`.
- On `line 4` we invoke `pop` method on the object the local variable `array` is referencing. This method permanently mutates this array object by removing the last element of the array and returning it to the caller.
- On `line 7` we invoke `mutate` method and pass in `a` local variable to output its return value, which is `3`.
- This code demonstrates a method definition that mutates its caller. This permanently modifies the object that local variable `a`  is referencing outside the method definition's scope. 

***

```ruby
a = [1, 2, 3]

def no_mutate(array)
  array.last
end

p no_mutate(a)
```

- On `line 1` we initialize local variable `a` and set it to reference an array of integers, `1`, `2`, `3`. 
- On `line 3` we define `no_mutate` method definition, and pass in local variable `array` to it as a parameter.
- On `line 4` we invoke array method `#last` on the array object.  
- On `line 7` we invoke `#p` method to output the return value of the `no_mutate(a)` method, which is `3`. 
- The value of `a` is still `[1, 2, 3]` because `#last` does not mutate the caller, therefore the original Array object is unchanged.
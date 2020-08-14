# puts vs return

In Ruby, every method returns the evaluated result of the last line that is executed.

```ruby
a = [1, 2, 3]

def mutate(array)
  array.pop
end

p mutate(a)
```

- On `line 1` we initialize local variable `a` and set it to reference an Array object with integer objects `1`, `2`, `3`.
- On `line 3` we define `mutate` method definition and pass in local variable `array` to it as a parameter.
- On `line 4` we invoke array method `#pop` on the object `array` object, which permanently mutates the array object which removes the last element of the array and returns it to the caller.
- On `line 7` we invoke `mutate` method and pass in local variable `a` to it as an argument to output its value.
-  `array.pop` is the last and only evaluated line of the method, therefore it is implicitly returned by the method.
- This demonstrates that objects passed into a method definition can be mutated permanently. 

***

```ruby
def add_three(number)
  number + 3
end

returned_value = add_three(4)
puts returned value
```

- On `line 1` we define method definition `add_three` and pass in local variable `number` to it as a parameter.
- Integer object `4` is passed to `add_three` as argument on `line 5` and is  assigned to the `number` parameter.
- This number is added to integer object `3` on `line 2` within the method definition.
- On `line 5` we save the return value of the `add_three` method invocation to a local variable called `returned_value`. 
- This outputs `7`, which is what the method call returned.

***

```ruby
def add_three(number)
  return number + 3
end

returned_value = add_three(4)
puts returned_value
```

- On `line 1` we define `add_three` method definition and pass in local variable `number` to it as a parameter.
- Integer object `4` is passed in as an argument to `add_three` on `line 5`, and is thus assigned to `number` parameter.
- On `line 2` we explicitly return the value of adding `number`, which is referencing integer object `4`, to integer object `3`.
- On `line 5`, the return value of the `add_three` method is saved into local variable `returned_value`, which is `7`. 
- On `line 6`, we invoke `puts` method and pass in `returned_value` as an argument to it, outputting its value, which is `7`.
- This demonstrates that you can explicitly return a value from a method by using the keyword `return` from within the method.

***

```ruby
def add_three(number)
  return number + 3
  number + 4
end

returned_value = add_three(4)
puts returned_value
```

- On `line 1` we define `add_three` method definition and pass in local variable `number` to it as a parameter.
- Integer object `4` is passed into the `add_three` method on `line 6` and this integer is assigned to the `number` parameter.
- On `line 2` we explicitly return from the method with the evaluated result of  `number + 3`, which is `7`.
- On `line 3` , we are not executing this line of code because we returned from the method on the line of code above it.
- On `line 6` the return value of the `add_three` method is saved in local variable `returned_value`.
- On `line 7` we invoke `puts` method and pass in variable `returned_value` which references the integer object of `7`.
- This demonstrates that inserting the keyword `return` in the middle of a method definition will return the evaluated result of that line of code without executing any code on the next lines.

***

```ruby
def just_assignment(number)
  foo = number + 3
end

p just_assignment(2)
```

- On `line 1` we define `just_assignment` method definition and pass in local variable `number` to it as a parameter.
- On `line 2` we save the evaluated result of `number + 3` to variable `foo`.
- On `line 5` we call `p` method to output the return value of `just_assignment(2)`, which is `5`.
- This code demonstrates that the keyword `return` is not required to return something from a method. This expression evaluates to `5`, so that is what is returned. 
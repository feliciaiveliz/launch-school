# 101 Written Assessment Answer Sheet

On `line 1` we initialize local variable `a` in the outer scope and set it to reference a String object with a value of `hello`.

On `line 1` we initialize local variable `a` and set it to reference an Integer object with a value of `5`.

On `line 1` we initialize local variable `arr` and set it to reference an Array object that contains `4` Integer objects with values of `1`, `2`, `3`, `4`.

## loop

On `lines 1-3` we invoke the `loop` method invocation and pass in the `do..end` block to it as an argument. This defines a block and creates an inner scope.

On `lines 1-3` the `do..end` following the `loop` method invocation defines a block and therefore creates an inner scope.

## puts

On `line 1` we invoke the `puts` method and pass in local variable `a` to it as an argument, outputting its value, which is `7`, and returning `nil`.

On `line 1` we invoke the `puts` method and pass in local variable `str` to it as an argument, outputting its value, which is `hello`, and returning `nil`.

`puts` always returns `nil`.

`puts` stands for `put string`. It attempts to convert everything to a string by calling `to_s`. It adds a newline at the end of the message.

`puts` prints something to the screen, but it does not return what is printed to the screen. 

## return

Unless an explicit `return` comes before it, every method returns the evaluated result of the last expression that is executed. This is an implied return value.

## each

This code example outputs integers `1`, `2`, `3`, and `4`, and returns the original calling object, the array object `arr` is referencing. 

`each` is a method that iterates over a collection of objects, passing in each element and executes the code within the block for that element. It doesn't care about the return value of the block or its truthiness; it returns the original calling object. 

From lines `1-3` the `do..end` following the `each` method invocation defines a block and is passed to `each` as an argument to the method. This creates an inner scope.

## map

`map` is a method that iterates over a collection of objects and performs transformation on its elements based on the block's return value. It uses that return value as 'transformation criteria'. It doesn't care about the block's truthiness. It puts those transformed elements into a new collection object and this is what ultimately gets returned. 

## select

`select` is a method that iterates over a collection of objects and performs selection. It selects elements based on the truthiness of the block's return value. If the the block evaluates to true for that iteration, `select` takes that element and puts it into a new collection. If the block evaluates to false on an iteration, that element will not get selected. Once `select` is done iterating, it returns the new collection of selected elements. 

## counter

On `line 1` we initialize local variable `counter` and set it to reference an Integer object with a value of `0`. This variable is used to keep track of the number of iterations performed by the `loop` method invocation.

## increment counter

On `line 1` we increment the `counter` by `1`.

On `line 5` we are reassigning the local variable `counter` to the return value of a method call `Integer#+` on the local variable `counter` with integer `1` passed to it as an argument.

## decrement counter

On `line 5` we are reassigning the local variable `counter` to the return value of a method call `Integer#-` on the local variable `counter` with integer `1` passed to it as an argument.

## break keyword with if conditional

On `line 1` we use the keyword `break` along with an `if` conditional statement. 

The keyword `break` and the conditional `if` statement on `line 5` will execute when the integer represented by the `counter` variable is equal to the size of the `numbers` array.  ***

The keyword `break` and the conditional `if` statement on `line 5` will execute when the integer represented by the `counter` variable is equal to the size of the `numbers` array.  ***

We are breaking out of the `loop` by using the keyword `break` if the value of the object that local variable `i` is referencing is equal to the integer `0`. 

## local variable references

Local variable `a` is being initialized to a String object with a value of `hello`.

Local variable `b` is being initialized to the same String object that local variable `a` is referencing.

This example demonstrates local variable scoping rules, specifically the fact that local variables initialized in the outer scope outside of a block are accessible inside the block.

## truthiness

Local variable `a` is truthy. 

Local variable `a` evaluates to true.

Local variable `a` is falsey.

Everything in Ruby is considered `truthy` except `false` or `nil`.

Ruby considers anything other than `false` and `nil` to be truthy, which is not the same as the `true` object. 

## mutating methods

Mutating methods in Ruby are those which change the value of the original calling object.

On `line 1` we are calling method `object_id` on local variable `a` to check what is the id of the object this variable is referencing.

For example: 

```ruby
name = "Felicia"
puts name # => Felicia
puts name.object_id # => 454897895489322

name.reverse!

puts name # => "aicileF"
puts name.object_id # => 454897895489322
```

## method definitions

A method definition is created when we define a Ruby method with the `def` keyword. They are self-contained when it comes to local variables. Local variables initialized outside the method definition are not available within the method definition, nor are local variables within the method definition available outside of it. If the method definition needs access to a local variable in the outer scope, it must be passed in as a parameter at the method definition level and called with an argument passed to it. Method definitions can mutate an object within it if it performs a mutating operation on the object. 

Method invocation is when we invoke or call the method.  This could be a method from the Ruby Core API or one that we've created ourselves. 

On `line 8` we are calling the method definition `example` and passing in string `hello` to it as an argument. 

On `line 8` we are calling the method definition `example` and passing in integer `5` to it as an argument. 

This method definition outputs `hello` 3 times and returns `nil`. This is because the last evaluated line of code within the example method definition returns `nil`.

## method invocation with a block

The `do..end` immediately following a method invocation defines a block and creates an inner scope. Local variables initialized in the outer scope are available to the block; the block can then reassign or use those variables.  This change will be reflected in the outer scope. 

## variables as pointers

Variables are pointers to physical spaces in memory. Some operations can mutate the address space in memory. This change would be reflected in all of the variables that point to this address space. If the operation is non-mutating, this will cause the variable to point to a new address space. 

## implicit return

Methods return the evaluated result of the last line of code that is executed, unless the `return` keyword comes before it. In that case, any code below the `return` keyword will not be executed. 

## variable scope

A variable's scope is determined by where it's created. A block defines a variable's scope. Local variables in an inner scope can access local variables initialized in an outer scope, but local variables initialized in an inner scope cannot be accessed by the outer scope. 

## Reassignment

Reassignment to a variable doesn't change the object referenced by that variable, it instead is bound to a completely new object. It is not a method, but it acts like a non-mutating method. 

An example: 

```ruby
a = 7
b = a
a = 3
```



## nil

`False` and `nil` are both treated as negative when evaluated in an expression. They are not equal. `nil` represents an absence of content, or nothing, in Ruby.

## Variable Shadowing

Variable shadowing is when local variables in the outer scope and inner scope share the same name. The code within the block will use the block parameter local variable and ignore the outer scope local variable. This prevents access to the outer scope local variable and we then cannot make changes to it. 
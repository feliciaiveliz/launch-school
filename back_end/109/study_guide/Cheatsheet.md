# 101 Written Assessment Cheat Sheet

On `line 1` we initialize local variable `a` in an outer scope and set it to reference a String object with a value of `hello`.

On `line 1` we initialize local variable `a` and set it to reference an Integer object with a value of `5`.

On `line 1` we initialize local variable `arr` and set it to reference an Array object that contains `4` Integer objects with values of `1`, `2`, `3`, `4`.

On `lines 1-3` we invoke the `loop` method invocation and pass in the `do..end` block to it as an argument. This defines a block and creates an inner scope.

On `lines 1-3` the `do..end` following the `loop` method invocation defines a block and therefore creates a new inner scope.

On `line 1` we invoke the `puts` method and pass in local variable `a` to it as an argument, outputting its value, which is `7`.

This code example outputs integers `1-4` and returns `nil`.

The `each` method outputs `1`, `2`, `3`, and `4`, and returns the original calling object, the Array object `arr` is referencing. 

On `line 1` we initialize local variable `counter` and set it to reference an Integer object with a value of `0`. This variable is used to keep track of the number of iterations performed by the `loop` method invocation.

On `line 1` we increment the `counter` by `1`.

On `line 1` we use the keyword `break` to exit this `loop` if the value of the object that `counter` is referencing is equal to `0`.

On `line 5` we are reassigning the local variable `counter` to the return value of a method call `Integer#+` on a local variable `counter` with integer `1` passed to it as an argument.
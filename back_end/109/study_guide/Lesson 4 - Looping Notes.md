# Looping

```ruby
arr = [1, 2, 3, 4, 5]
arr[0] += 1
arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
arr # => [2, 3, 4, 5, 6]
```

- On `line 1` we initialize local variable `arr` and set it to reference an Array object that contains `5` Integer objects, `1-5`.
- On `line 2` we use array element reference to retrieve the element at the `0` position of the array, reassigning its value by incrementing it by `1`.
- On `line 7` we return the same array object `arr` is pointing to, although with different integer values, `2-6`.

```ruby
arr = [1, 2, 3, 4, 5]
counter = 0

loop do
  arr[counter] += 1
  counter += 1
  break if counter == arr.size
end

arr # => [2, 3, 4, 5, 6]
```

- On `line 1` we initialize local variable `arr` and set it to reference an Array object that contains integer objects `1-5`.
- On `line 2` we initialize local variable `counter` and set it to reference integer object `0`.
- On `line 4` the `do..end` following the `loop` method invocation defines a block and an inner scope.
- Within the block, on `line 5` we increment each element of the array by `1` using the `counter` variable to keep track of the current iteration.
- On `line 6` we increment the counter variable by `1`; this allows us to move to the next element in the array.
- On `line 7` we use keyword `break` and a conditional `if` statement to exit this loop if the integer that is returned by calling `#size` on the array is equal to the last value of `counter`.
- On `line 10` we output the value of `arr`, which is the same array object but with each element incremented by `1`.
- This demonstrates iteration over an Array object with simple loop. In order to increment over the elements and execute the code within the block for each element, we need to initialize variables in the outer scope for them to be accessible in the inner scope. 

***

```ruby
loop do
  puts 'Hello!'
  break
end
```

- This code outputs `Hello!` and returns `nil`.
- On `lines 1-4`, the `do..end` following the `loop` method invocation defines a block and creates an inner scope, within which on `line 2` we invoke the `puts` method and pass in a String object with a value of `Hello!`. 
- The `break` keyword on `line 3`  is necessary to prevent an infinite loop; it allows the loop to execute at least once and then it exits the nearest loop.

***

```ruby
loop do
  number = rand(1..10)   # a random number between 1 and 10
  puts 'Hello!'
  if number == 5
    puts 'Exiting...'
    break
  end
end
```

- On `lines 1-8` the `do..end` following the `loop` method invocation defines a block and a new inner scope. 
- We initialize local variable `number` on `line 2` and set it to reference a random number between 1 and 10 on each iteration, by invoking the `rand` method and passing in a range of numbers `(1..10)`.
- On `line 3` we invoke the `puts` method and pass in a String object with a value of `Hello!` for each iteration.
- On `lines 4-7` we use a conditional `if` statement to break out of this loop if the integer that the `number` variable is referencing is equal to `5`. If so, on `line 5`, the `puts` method will be invoked, outputting the String object `Exiting...` Following that the `break` keyword will exit this loop. Otherwise the `loop` repeats.
- This code demonstrates that we can use a condition statement with a `break` keyword to make sure that a `loop` can iterate more than once, and only stop when a certain condition is met.

***

### Iteration

```ruby
counter = 0

loop do
  puts 'Hello!'
  counter += 1
  break if counter == 5
end
```

- On `line 1` we initialize local variable `counter` and set it to reference an Integer with a value of `0`. This variable keeps track of the number of iterations performed by the `loop` method invocation.
- On `lines 3-7` the `do..end` following the `loop` method invocation defines a block and an inner scope, within which on `line 4` we invoke the `puts` method and pass in a String object with a value of `Hello!` on each iteration.
- On `line 5` we increment the integer value reference by `counter` by `1`. 
- On `line 6` we use keyword `break` and a conditional `if` statement to check on each iteration `counter` is equal to `5`. If so, then we exit the loop, otherwise the loop repeats. 
- This code outputs `Hello!` `5` times and returns `nil`.
- This code demonstrates that we can use a conditional statement with keyword `break` to control how many iterations we want a `loop` to perform. This guarantees that the `loop` will execute at least once and stop when the condition is met.

***

```ruby
counter = 0

loop do
  break if counter == 0
  puts 'Hello!'
  counter += 1
end
```

- This code will not output anything to the screen, and will return `nil`.
- On `line 1` we initialize `counter` variable and set it to reference an Integer with a value of `0`; this variable represents the current iteration of the `loop` method invocation. 
- On `lines 3-7` the `do..end` following the `loop` method invocation defines a block and an inner scope. 
- On `line 4` a conditional `if` statement is used with the keyword `break` to stop execution of the `loop` if the `counter` variable is equal to `0`. 
- Since `counter` variable is equal to `0` on the first iteration, the code below it will not execute. 

***

### Next

When `next` is executed, the rest of the current iteration is skipped and the loop begins the next one.

```ruby
counter = 0

loop do
  counter += 1
  next if counter.odd?
  puts counter
  break if counter > 5
end
```

- This code example outputs `2`, `4`, `6` and returns `nil`.
- On `line 1` we initialize local variable `counter` and set it to reference the Integer object `0`. This variable keeps track of the number of iterations performed by the loop method.
- From `lines 3-8` the `do..end` following the `loop` method invocation defines a block and creates an inner scope. 
- Within this inner scope, we increment the `counter` variable by `1` on line `4`.
- On `line 5`, we use `next` keyword to skip the current iteration if the `counter` variable is referencing an `odd` integer. `Integer#odd?` returns true if an integer is odd and `false` if it's true.
- If the `counter` variable is `odd`, then on `line 6` we invoke the `puts` method and pass in the `counter` variable, outputting its value.
- The `break` keyword and conditional `if` statement on `line 7` is used to exit the loop if the integer `counter` is referencing is greater than `5`.

***

```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'
counter = 0

loop do 
  break if counter == alphabet.size
  puts alphabet[counter]
  counter += 1
end
```

- This code outputs each letter of this string, `a-z` and returns `nil`.
- On `line 2` we initialize local variable `counter` and set it to reference the Integer object with a value of `0`.
- From `lines 3-7` the `do..end` following the `loop` method invocation defines a block and an inner scope.
- Within this inner scope, on `line 5`, we use keyword `break` and a conditional `if` statement to exit the `loop` if the counter variable is equal to the length of the `alphabet` string. `String#size` returns the number of characters in a given string.
- On `line 6` we invoke the `puts` method and use string reference to retrieve each letter based on its index for each iteration.
- We increment the value reference by the `counter` variable on `line 7` by `1`.

***

```ruby
colors = ['green', 'blue', 'purple', 'orange']
counter = 0

loop do 
  break if counter == colors.size
  puts "I'm the color #{colors[counter]}!"
  counter += 1
end
```

- This code outputs `I'm the color green!`, `I'm the color blue!`, `I'm the color purple!`, and `I'm the color orange!`. This code will return `nil`.
- On `line 1` we initialize local variable `colors` and set it to reference an Array object that contains `4` String objects, `green`, `blue`, `purple`, `orange`.
- On `line 2` we initialize local variable `counter` and set it to reference an Integer object with a value of `0`.
- From `lines 4-8` the `do..end` following the `loop` method invocation defines a block and an inner scope.
- Within this scope on `line 5`, we use keyword `break` and an `if` conditional statement to exit the loop when the length of the `colors` string is equal to the `counter` variable.
- On `line 6` we invoke the `puts` method and pass in string `"I'm the color #{colors[counter]}!"` to it as an argument. We use array `element reference` to retrieve the current element by using the `counter` variable as the index value of each element.
- We increment the `counter` variable by `1` on `line 7`.

***

```ruby
number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}
pets = number_of_pets.keys # => ['dogs', 'cats', 'fish']
counter = 0

loop do
  break if counter == number_of_pets.size
  current_pet = pets[counter]
  current_pet_number = number_of_pets[current_pet]
  puts "I have #{current_pet_number} #{current_pet}!"
  counter += 1
end
```

- This code outputs `I have 2 dogs!`, `I have 4 cats!` and `I have 1 fish!` and returns `nil`.
- From `lines 1-4` we initialize a variable called `number_of_pets` and set it to reference a hash that contains 3 key-value pairs. Each key is a string and its associated value is an integer.
- On `line 2` we initialize local variable `pets` and set it to reference the return value of calling `Hash#keys` on the hash object `number_of_pets` is referencing. This returns an Array object that contains all 3 `keys` from the `number_of_pets` hash.
- On `line 3` we initialize local variable `counter` and set it to reference an Integer object `0`.
- On `lines 9-15` , the `do..end` following the `loop` method invocation defines a block and creates an inner scope. 
- On `line 10` we use keyword `break` with a conditional `if` statement to exit the loop if the number of elements in the array `pets` is referencing is equal to `counter`.
- On `line 11` we use array element reference to retrieve the current element from the array and we save it to the local variable `current_pet`.
- On `line 12` we use the `current_pet` key to retrieve the appropriate value from the `number_of_pets` hash, and this is saved into local variable `current_pet_number`.
- The `puts` method is invoked on `line 13` and is passed a string as an argument that uses string interpolation to output the current key and the current value.
- We increment the `counter` variable by `1` for each iteration.

***

### Summary

How many elements does looping comprise of?

- a loop
- a counter
- a way to retrieve the current value
- a way to exit the loop
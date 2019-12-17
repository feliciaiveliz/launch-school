# Methods

```ruby
numbers = [1, 2, 3]
counter = 0

loop do 
  break if counter == numbers.size
  puts numbers[counter]
  counter += 1
end
```

- On `line 1` we initialize local variable `numbers` and set it to reference an array object that contains integer objects `1`, `2` and `3`.
- On `line 2` we initialize local variable `counter` and set it to reference an integer object with a value of `0`.
- From `lines 4-8` the `do..end` following the `loop` method invocation defines a block and creates a new inner scope.
- The keyword `break` and the condition `if` statement on `line 5` will execute when the integer represented by the `counter` variable is equal to the size of the `numbers` array.
- We use array element reference on `line 6` to retrieve the element of the  array at that position. We use the `counter` variable to represent the current position in the array.
- On `line 7` we increment the `counter` variable by `1`.

***

```ruby
[1, 2, 3].each do |num|
  puts num
end
```

- This code example returns the original calling object and outputs `1`, `2`, `3`.
- `each` is being called on the Array object `[1, 2, 3]`.
- The `do..end` from `lines 1-3` defines a block and creates an inner scope.
- On each iteration, each sends the block the value of the current element in the form of an argument. This is represented by the `num` variable and it represents the value of the current element in the array. 
- On each iteration, we invoke the `puts` method and pass in each element of the array to it to output its value.

***

```ruby
hash = { a: 1, b: 2, c: 3 }

hash.each do |key, value|
  puts "The key is #{key} and the value is #{value}"
end
```

- This code returns the original calling object, `{ a: 1, b: 2, c: 3 }`, and outputs `The key is a and the value is 1`, `The key is b and the value is 2`, `The key is c and the value is 3`.
- On `line 1` we initialize local variable `hash` and set it to reference a hash that contains `3` key-value pairs. The keys are `a:`, `:b` and `:c` and are symbols. The values are `1`, `2` and `3` and are integers.
- On `lines 3-5` we invoke the `each` method on the hash object `hash` is referencing.
- We pass `do..end` to the `each` method invocation, which defines a block and creates an inner scope.
- We pass the block two arguments, `key` and `value`, which will represent each key and value of the hash.
- For each iteration, we output the string `"The key is #{key} and the value is #{value}"` using string interpolation to output the value of the keys and values. 

***

```ruby
def a_method
  [1, 2, 3].each do |num|
    puts num * 2
  end
end
```

- This code example returns `[1, 2, 3]` and outputs `2`, `4`, `6`.
- We define a method definition `a_method` from `lines 1-5`, within which we invoke `each` on an array object that contains 3 integer objects, `1`, `2`, `3`.
- The `do..end` on `lines 2-4` following the `each` method invocation defines a block and is passed to `each` as an argument to the method. This creates an inner scope. 
- On each iteration we assign the value of the current element to an argument that we pass to the block, `num`. 
- On `line 3` we invoke the `puts` method and pass in `num * 2` as an argument to output values `2`, `4`, and `6`.
- The last expression in this method is `[1, 2, 3].each`.
- This code example demonstrates that the return value of a method definition is the return value of the last evaluated expression within the method. Since `[1, 2, 3].each` is the last expression within `a_method`, this array object is what gets returned, even though there is code within the `each` method invocation.

***

```ruby
def a_method
  [1, 2, 3].each do |num|
    puts num * 2
  end

  puts 'hi'
end
```

- This code returns `nil` and outputs `2`, `4`, `6` and `hi`.
- This code demonstrates that the return value of a method definition is the return value of the last evaluated expression within the method. Specifically,  `puts 'hi'` is the last evaluated line of code within `a_method`. The return value of `puts` is `nil`, therefore the return value of `a_method` is `nil`.

***

# Select

```ruby
[1, 2, 3].select do |num|
  num.odd?
end
```

- This code example returns `[1, 3]` and outputs nothing.
- Within the block, `num.odd?` returns a boolean value, either true or false. It is checking to see if the current value that is being passed into the block is an odd value. If it is, it will be selected to be put into a new array object. If it is even, it will not be selected.
- Integer objects `1` and `3` were selected to be put into a new array object because they evaluated to `true`, when they were evaluated by `select` in the block.

***

```ruby
[1, 2, 3].select do |num|
  num + 1
end
```

- This code example returns a new array object that contains integer values of `[1, 2, 3]` and outputs nothing to the screen.
- The last expression within the block, `num + 1`, will always evaluate to an integer, a "truthy value". The return value of the block will always evaluate to "truthy value".
- The return value of `select` is based on the "truthiness" of the *block's* return value. The return value of `select` in this code example will be all the integers of the original collection, `1`, `2` and `3` that will be placed into a new collection.

***

```ruby
[1, 2, 3].select do |num|
  num + 1
  puts num
end
```

- This code example will return an empty array object, `[]` and output integer objects `1`, `2` and `3`.
- The expression `puts nil` is the last evaluated line of code within the block, and `puts` always returns `nil`. Since `nil` is the return value of the block on every iteration, nothing is selected because it is always evaluates to a  `falsey` value. Therefore, the return value of `select` is an empty array. 

***

# Map

`map` is similar to `select` in that it considers the return value of the block, however, it uses that return value to perform transformation instead of selection. 

```ruby
[1, 2, 3].map do |num|
  num * 2
end
```

- The return value of the block is the product of `num` and `2`. 
- `map` takes this value and places it **into a new collection**. This process is repeated for every element in the original collection. 
- The code within the block, `num * 2`, is the transformation instruction that `map` uses to perform transformation on elements.
- This code will return a new array object, `[2, 4, 6]`.

```ruby
[1, 2, 3].map do |num|
  num.odd?
end
```

- This code will return a new array object, `[true, false, true]`.
- `map` always performs transformation based on the return value of the block. 
- The return value of the block will be a boolean, which means that the collection returned by `map` will be an array of booleans.

```ruby
[1, 2, 3].map do |num|
  num.odd?
  puts num
end
```

- This code returns `[nil, nil, nil]` and outputs `1`, `2`, and `3`.
- The return value of the block will always be `nil`. 
- `map` doesn't care about truthiness, and takes this return value as the transformation criteria.

```ruby
[1, 2, 3].map do |num|
  'hi'
end
```

- This code returns `['hi', 'hi', 'hi']` and outputs nothing.
- `'hi'` is the only statement within the block, therefore the return value of the block is `'hi'`, which `map` will use as the transformation criteria. 

***



| Method   | Action         | Considers R.V of Block? | Length of returned collection   | Returns new collection?    |
| -------- | -------------- | ----------------------- | ------------------------------- | -------------------------- |
| `each`   | i              | No                      | No, returns original collection | Length of original         |
| `select` | Selection      | Yes, its truthiness     | Yes                             | Length of original or less |
| `map`    | Transformation | Yes                     | Yes                             | Length of original         |


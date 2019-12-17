# Beginner Ruby Video - Part 3

```ruby
a = 'hi'
b = a

a += b
```

- Two variables, one object from `lines 1-2`
- Local variable `a` is being initialized and set to reference a String object whose value is `hi`.
- Local variable `b` is being initialized and set to reference the same String object that `a` is referencing, which is string object `hi`.
- On `line 3` `a` is being reassigned to a different object. 

***

```ruby
4.times { puts 'hi' }
```

- We are invoking the `#times` method on integer object `4`. The `{}` defines a block after the `#times` method invocation. This creates a new inner scope.
- Within this block, we invoke `puts` method and pass in String object with value of `hi` to it to output its value `4` times. 
- `hi` is output `4` times to the screen and returns `nil` on each iteration.

***

Collections include Arrays, Hashes or Strings. Its a structure that holds data. 

Arrays uses the `[]` syntax, and Hashes use `{}`. Arrays hold a series of elements that are retrievable by their index. It starts from 0 and counts upwards. To count backwards, start at -1 and count backwards. 

The keys in a hash must be unique. You cannot have the same key multiple times in a hash. The key can be any object but it is preferred that they are symbols: `a:`.

Arrays are ordered by index, the insertion order is preserved. The pairs in a hash are retrievable by keys.

```ruby
hsh = {a: 1}
```

- We are initializing `hsh` local variable to a hash.
- `a:` is a symbol and is the key, and the `1` is an integer and is its value.

***

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

idx = 0

loop do 
  puts arr[idx]
  idx += 1
  break if idx == arr.size
end
```

- On `line 1` we initialize local variable `arr` and set to it reference an Array object with integers `1-10`. 
- On `line 2` we initialize local variable `idx` and set it to reference integer `0`.
- On `lines 5-9` we invoke the `loop` method invocation and pass in the `do..end` to it as an argument. This defines a block and creates an inner scope. 
- On `line 6` we invoke the `puts` method and pass in `arr[idx]` to output the value of each element at the current index.
- On `line 7` we increment the `idx` variable by `1` after each iteration.
- On `line 8` we use a `break` statement to exit the loop when the integer that `idx` is referencing is equal to the size of the array. `arr.size` returns an integer that represents how many elements are in this array and this is what is being compared to the object `idx` is referencing.
- This `loop` method invocation with a block returns nil, because `puts` returns `nil` always.

***

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each do |n|
  puts n
end
```

- On `line 1` we initialize local variable `a` and set it reference Array object with integer `1-10`.
- On `lines 3-5` we invoke the `#each` method on the array object local variable `arr` is referencing, passing in the `do...end` block as an argument to the method.
- `#each` iterates through an array and executes the code within the block for each element.
- On `line 3-5`, the `do...end` alongside the `#each` method invocation defines a block and an inner scope. 
- On `line 3`, we pass in local variable `|n|` to the block as a parameter, and on every iteration we assign the value of the current element to this block parameter. 
- On `line 4` we invoke the `puts` method and pass in `n` variable to it as an argument, outputting its value per each iteration. 
- This code will output integers `1-10` and will return the original calling object, the array `arr` is referencing. 
- This code demonstrates local variable scoping rules; local variables initialized in an outer scope can be accessed in an inner scope created by a block following a method invocation. `#each` does not use the return value of the block, as it returns the original collection. 

**ask for clarification**

***

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }
```

- On `line 1` we initialize local variable `a` and set it to reference an Array object with integer values `1-10`. 
- On `line 3` we invoke `select` method on object `arr` is referencing.
- The `{}` after `#select` is passed to the method as an argument and defines a block. This creates an inner scope, within which we pass in local variable `|n|` as a parameter to the block.
- On each iteration, the value of the current element is assigned to the `|n|` block parameter.
- Within the block, `n.odd?` is checking to see if the current element is an odd number. If `n.odd?` evaluates to `true` on that iteration, it selects this element and puts in into a new array object. Otherwise it does not if it evaluates to `false`.
- This method invocation returns a new array object of integer values, `[1, 3, 5, 7, 9]`.
- The `#select` method returns a new array based on the block's *return value*. If it **evaluates** to true, then the element is selected. 

***



```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

odds = arr.select do |n|
  n + 1
  puts n
end

p odds
```

- On `line 1` we initialize local variable `a` and set it to reference an Array object with integer values `1-10`. 
- On `line 3` we invoke `select` method on the object `arr` is referencing, and the return value is saved into local variable `odds`.
- The `do...end` after `#select` defines a block and is passed to the method as an argument. This creates an inner scope, within which we pass in local variable `|n|` as a parameter to the block.
- On `line 4` we add `1` to the current value of `|n|`.
- On `line 5`, we invoke the `puts` method and pass in the variable `|n|`, outputting its value and returning `nil` on every iteration.
- On `line 8`, we invoke `p` method and pass in local variable `odds` to output its value, which is an empty array, `[]`.
- The `#select` method returns a new array based on the block's return value. If it evaluates to `true`, then the element is selected, otherwise if it evaluates to `false`, it is not selected. `#select` chooses elements based on the block's `truthiness`.
- Since `line 5` is the last evaluated expression in the method and we `puts` the value of `n` for every iteration, the element is not selected to be put into the new array because it evaluates to `nil`. 

***

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map {|n| n + 1}

p increment
```

- On `line 1` we initialize local variable `a` and set it to reference an Array object with integer values `1-10`. 
- `#map` returns a new array based on the block's return value. Each element is transformed based on the return value. 

***

```ruby
hash = {a:1, b:2, c:3, d:4, e:5}

hash.each do |k, v|
  puts "key is #{k}, value is #{v}" if v < 3.5
end
```

- On `line 1`, we initialize local variable `hash` and set it to reference a hash that contains 5 key/value pairs. 
- Each key is a symbol from letters `a-e`, and each value is an integer from `1-5`.
- On `line 3` we invoke `#each` method on the object local variable `hsh` is referencing. `#each` iterates through an array, executing the code within the block for each iteration.
- The `do...end` after the method invocation is passed to `#each` as an argument. It defines a block and creates a new inner scope. 
- We pass in local variables `k` and `v` as parameters to the block; for every pair, the key will be assigned to `k` and the value will be assigned to `v` on every iteration.
- On `line 4` we invoke `puts` method, passing in a String object and an if conditional statement.
- This method invocation will output `key is a, value is 1`, `key is b, value is 2`, `key is c, value is 3`. This method will return the original hash object: `hash = {a:1, b:2, c:3, d:4, e:5}`.


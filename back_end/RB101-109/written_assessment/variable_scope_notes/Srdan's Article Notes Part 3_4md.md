##Code Examples From Srdan's Articles Part 3 & 4

What will this output and why? 

```ruby
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end
  
puts a
puts b
```

This code outputs `5`, `5`, `4`, `2`.

On `line 6` local variable `a` is being initialized and set it to reference Integer object whose value is `4`.

On `line 7` local variable `b` is being initialized and set to an Integer value of `2`.

On `line 9` we invoke `times` method on Integer `2` and pass in `do...end` block as an argument to this method, with one parameter `a`.

Within this block on `lines 9-12` we set the value of local variable `a` that was passed in as parameter to the block to an Integer `5`. 

On `line 11` we invoke `puts` method from within `do...end` block and pass in local variable `a` as argument, which outputs `5` two times. 

On `line 14` we invoke `puts` method and pass in local variable `a` to output its value, which is `a` since it wasn't modified. 

On `linen 15` we invoke `puts` method and pass in local variable `b` to output its value, which is `2`.

This code example demonstrates a concept called `variable shadowing`. This is when a local variable that is initialized in the outer scoped is the same name as the parameter name of the block that is passed into the method. This prevents access to the outer scoped local variable, causing it to be unchanged within the block.

***

### Each, Map, and Select

What is output and returned here?

```ruby
[1, 2, 3, 4].each { |num| puts num }
```
This method will output `1`, `2`, `3`, `4` and return `nil`.

The `Array#each` method iterates through this array object passing in each element of the array into the block, assigning it to the block parameter `num` and outputting its value with `puts num` on each iteration.

On each iteration, the block returns `nil` because `puts` method always returns `nil`, however `Array#each` does not use this return value. 

***

What is output and returned here? 

```ruby
[1, 2, 3, 4].map { |num| puts num }
```

This code example outputs `1`, `2`, `3`, and `4` and returns a new array object of `nil`s. `[nil, nil, nil, nil]`

`Array#map` iterates through this array object passing in each element to the block, assigning it to block parameter `num` and outputting its value on each iteration with `puts num`. 

However on each iteration we invoke `puts` method, `nil` is returned because `puts` always returns `nil`. `Array#map` uses this return value by putting it into a new array and when the method is finished iterating through the collection, it returns the new array with `nil` values. 

***

What does this output and why? 

```ruby
[1, 2, 3, 4].select { |num| puts num }
```

This will output `1`, `2`, `3`, `4` and return an empty array.

`Array#select` iterates through the array object passing in each element to the block parameter `num`, output each integer on every iteration. `select` considers whether or not the return value of the block evaluates to `true` on each iteration, and will select that element to put into a new collection object, otherwise nothing will be selected. 

*** 

### Mutating/Non-mutating Ruby Methods

```ruby
a = 'hello'

puts a #=> hello
puts a.object_id #=> 70368527757720

a.upcase!

puts a # => HELLO
puts a.object_id # => 70368527757720 (number is same as above)
```

On `line 82` we initialize local variable `a` and assign it to String object with value of `hello`.

On `line 84` we invoke `puts` method and pass in `a` local variable to output its value, which is `hello`.

On `line 85` we invoke `object_id` method on local variable `a` to check the id of the object that this variable is referencing.

On `line 87` we invoke the mutating method `String#upcase!` on the object local variable `a` is referencing. 

On `line 89` we invoke `puts` method and pass in local variable `a` as argument to output its value, which is `HELLO`. 

On `line 90` we invoke `object_id` method on local variable `a` again and we see that the object id is unchanged because `String#upcase!` mutates the original string, therefore the id will not be different.

***

What will be output and why?

```ruby
a = 'hello'

puts a # -> hello
puts a.object_id # -> 70368468160540 (this number will be different for you)

a.upcase 

puts a # -> hello
puts a.object_id  # -> 70368468160540 (this number will be the same as the one above)
```

On `line 110` we initialize local variable `a` and assign it to String object with value of `hello`.

On `line 112` we invoke `puts` method and pass in `a` local variable to output its value, which is `hello`.

On `line 113` we invoke `object_id` method on local variable `a` to check the id of the object that this variable is referencing.

On `line 115` we invoke the nonmutating method `String#upcase` on on the object local variable `a` is referencing. 

On `line 117` we invoke `puts` method and pass in `a` local variable to output its value, which is still `hello`.

On `line 118` we invoke `object_id` method on local variable `a` again and we see that the object id is changed. `String#upcase` does not mutate the original string. It creates a brand new String object and the value that `a` is referencing in unchanged. 

***

```ruby
a = 'name'
b = 'name'
c = 'name'

# Are these three local variables pointing to the same object?

puts a.object_id
puts b.object_id
puts c.object_id

# And when we add these two lines of code... ?

a = c
b = a

puts a.object_id
puts b.object_id
puts c.object_id

# What about now?
a = 5
b = 5
c = 5

puts a.object_id
puts b.object_id
puts c.object_id
```

Local variables `a`, `b` and `c` are initialized on `lines 1-3` and all share the same value `name`. They are all pointing to different String objects. We verify that by invoking `object_id` on each local variable. 

On `line 148` we reassign local variable `a` to reference the same String object as local variable `c` is. Now, local variables `a` and `c` are pointing to one object, while b is pointing to a different one. 

On `line 149` we reassign local variable `b` to point to the same object that local variables `a` and `c` are pointing to, so now all three local variables are pointing to the same String object. 

On `lines 156-158` local variables `a`, `b` and `c` are each reassigned to one Integer object, 5. This is because Integers in Ruby with same values occupy the same physical space in memory. This is verified by invoking `object_id` on these local variables as it shows that the ids are the same. 

***

```ruby
a = :dog
b = :dog
c = :dog

puts a.object_id
puts b.object_id
puts c.object_id
```

Local variables `a`, `b`, `c` are pointing to the same object in memory. 

***


















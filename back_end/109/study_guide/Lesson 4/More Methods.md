# More Methods

```ruby
[1, 2, 3].any? do |num|
  num > 2
end
```

- This code returns `true` and outputs nothing.
- There are two return values: one of the **method** and one of the **block**.
- `any?` looks at the truthiness of the block's return value to determine what the **method's** return value will be.
- If the block returns a 'truthy' value for any element in the collection, then the method returns `true`.

***

`Enumerable#any?` can be used with a hash:

```ruby
{ a: 'ant', b: 'bear', c: 'cat' }.any? do |key, value|
  value.size > 4
end
```

- This code returns `false`.  The code within the block is checking to see if any value in the hash is greater than 4.

***

`Enumerable#all?`

This method functions similar to `any?` in that it looks at the truthiness of the block's return value, but the method only returns `true` if the block's return value in **every** iteration is truthy. (not `false` or `nil`)

```ruby
[1, 2, 3].all? do |num|
  num > 2
end
```

- This code returns `false` and outputs nothing. The code within the block is checking to see if all of the element's values are greater than `2`.

***

```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
```

- This code returns `true`. This code is checking to see whether or not the values of the hash are greater or equal to `3` in length.

***

```ruby
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}"
end

# The index of 1 is 0.
# The index of 2 is 1.
# The index of 3 is 2.
# => [1, 2, 3]
```

- This code returns the original calling object, array object `[1, 2, 3]`.
- The block takes two arguments, `num` and `index`, which represents the current element and it's index in the array.

***

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}."
end

# The index of [:a, "ant"] is 0.
# The index of [:b, "bear"] is 1.
# The index of [:c, "cat"] is 2.
# => { :a => "ant", :b => "bear", :c => "cat" }
```

- When called on a hash, the first argument to the block represents an array containing both key and the value.
- This returns the original calling object, the hash object `{ a: "ant", b: "bear", c: "cat" }`.

***

```ruby
[1, 2, 3].each_with_object([]) do |num, array|
  array << num if num.odd? 
end
```

- This method takes a block like the methods above, but it also takes a method argument. 
- The method argument is a collection object that will be returned by the method. 
- The block takes two arguments of its own. The first block argument represents the current element and the second block argument represents the collection object that was passed in as an argument to the method. 
- Once done iterating the method returns the collection object that was passed in. 
- The method will return array object `[1, 3]`. This is because the block checks to see if the numbers that were passed in are odd, if so, they are added to the array object. Once done iterating, this method returns the collection object. 
- `array` is initialized to an empty array. Inside the block, we can manipulate `array` . Here, we are just appending `num` if `num` is odd.

***

Similar to `each_with_index`, the first block argument turns into an array when we invoke `each_with_index` on a hash. 

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
# => ["ant", "bear", "cat"]
```

- This method returns an array object `['ant', 'bear', 'cat']`.
- Inside the block, this method retrieves the last element in the array that is passed in, which represents each key-value pair from the hash.

***

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
# => { "ant" => :a, "bear" => :b, "cat" => :c }
```

- It is possible to capture parentheses in the block argument. 
- This method returns a hash object that contains 3 key value pairs, where the key is the string object from the original hash and the value is the symbol.

***

```ruby
[1, 2, 3].first
```

- `first` doesn't take a block but it does take an optional argument which represents the number of elements to return. 
- If no argument is given, it returns only the first element in the collection.
- This code example returns `1`.

***

```ruby
{ a: 'ant', b: 'bear', c: 'cat' }.first(2)
```

- This code returns `[[:a, "ant"], [:b, "bear"]]`.
- This is a nested array that contains the first two key-value pairs from the hash object.

***

```ruby
[1, 2, 3].include?(1)
```

- This method doesn't take a block but it does require an argument to represent how many elements to return. It returns `true` if the argument exists and `false` if it doesn't.
- This code returns `true`.

***

```ruby
{ a: "ant", b: "bear", c: "cat" }.include?("ant")
# => false

{ a: "ant", b: "bear", c: "cat" }.include?(:a)
# => true
```

- When called on a hash, it only checks the **keys**.
- This is an alias for `Hash#key?` or `Hash#has_key?`. In practice, it is preferred over `include?`. 
- To find out if a value exists within a hash, we could use `Hash#value?` or `Hash#has_value?`.

***

```ruby 
[1, 2, 3].partition do |num|
  num.odd?
end
```

- This code returns `[[1, 3], [2]]`.
- The return value is a nested array, with the inner arrays separated based on the return value of the block. 

***

```ruby
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

odd  # => [1, 3]
even # => [2]
```

- The most idiomatic way to use `partition` is to parallel assign variable to capture the divided inner arrays. 

***

```ruby
long, short = { a: "ant", b: "bear", c: "cat" }.partition do |key, value|
  value.size > 3
end
# => [[[:b, "bear"]], [[:a, "ant"], [:c, "cat"]]]
```

- When called on a hash, the return value of `partition` will always be an array. 
- The first nested inner array, `[:b, 'bear']` returned `true` from the block so it is placed in the first array. The second array contains the key-value pairs in a hash for which the block returned `false`.

***

To transform the arrays back to a hash, call `Array#to_h`.

```ruby
long.to_h # => { :b => "bear" }
short.to_h  # => { :a => "ant", :c => "cat" }
```

***


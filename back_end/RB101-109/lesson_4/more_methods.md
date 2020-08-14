## More Methods

We will explore a couple Ruby methods and how they work. 

`Enumerable#any?`
The first thing to do if you're unsure of how a method works in ruby is to check documentation. 

any? [{|obj| block}] -> true or false
any? (pattern) -> true or false

Ruby `Array` and `Hash` includes the `Enumerable` module. 

```ruby
[1, 2, 3].any? do |num|
  num > 2
end # => true
```

There are two return values that we need to be aware of here: **the return value of the *method* and the return value of the *block*.**
`any?` looks at the *truthiness* of the **blocks** return value in order to determine what the method's return value will be. If the block returns a 'truthy' value for **any** element in the collection, then the method will return `true`.

`any?` can also be used with a hash. The only difference is that the block requires two parameters in order to access the key and the value.

```ruby
{ a: 'ant', b: 'bear', c: 'cat' }.any? do |key, value|
  value.size > 4
end
# => false
```

The code returns a boolean, signifying whether any value in the hash is greater than 4. 

### Enumerable#all?

`all?` functions in a similar way. It looks at the truthiness of the **block's** return value, but the method only returns `true` if the block's return value in **every** iteration is truthy (that is, not `false` or `nil`).

```ruby
[1, 2, 3].all? do |num|
  num > 2
end # => false
```

`all?` can also be called on a hash. 

```ruby
{ a: 'ant', b: 'bear', c: 'cat' }.all? do |key, value|
  value.length >= 3
end
# => true
```

### Enumerable#each_with_index

`each_with_index` is nearly identical to `each`. While both methods take a block and execute the code within the block, the block's return value is ignored. Unlike `each`, `each_with_index` takes a second argument which represents the index of each element. 

**Returns the original collection, like `each`?

```ruby
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end

# The index of 1 is 0.
# The index of 2 is 1.
# The index of 3 is 2.
# => [1, 2, 3]
```

When calling `each_with_index` on a hash, the first argument now represents an array containing both the key and the value.

```ruby
{ a: 'ant', b: 'bear', c: 'cat' }.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}."
end
# The index of [:a, "ant"] is 0.
# The index of [:b, "bear"] is 1.
# The index of [:c, "cat"] is 2.
# => { :a => "ant", :b => "bear", :c => "cat" }
```
### Enumerable#each_with_object

Besides taking a block like the methods above, `each_with_object` takes a method argument. The method argument is a collection object that will be returned by the method. On top of that, the method takes two arguments of its own.
First block argument
 - represents the current element
Second block argument
- represents the collection object that was passed in as an argument to the method 
Once it's done iterating, it returns the original collection object that was passed in as the argument. 

```ruby
[1, 2, 3].each_with_object([]) do |num, array|
  array << num if num.odd?
end
# => [1, 3]
```

`array` is initialized to an empty array, `[]`. Inside the block, we can now manipulate `array`. We are just appending the current `num` into it if it's odd.

Similar to `each_with_index`, the first block argument turns into an array when we invoke `each_with_object` on a hash. 

```ruby 
{ a: 'ant', b: 'bear', c: 'cat' }.each_with_object([]) do |pair, array|
  array << pair.last
end
# => ["ant", "bear", "cat"]
```

It is possible to use parentheses to capture the key and the value in the first block argument. 

```ruby
{ a: 'ant', b: 'bear', c: 'cat' }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
```

### Enumerable#first

`first` doesn't take a block, but it does take an optional argument which represents the number of elements to return. When no argument is given, it returns only the first element in the collection.

```ruby
[1, 2, 3].first
# => 1
```

When an argument is provided, `first` will return the specified number of elements. Now we'll call it on a hash. 

```ruby
{ a: 'ant', b: 'bear', c: 'cat' }.first(2)
# => [[:a, "ant"], [:b, "bear"]]
```

1. Hashes are typically thought of as unordered  and values are retrieved by keys. Since Ruby 1.9, order is preserved according to the order of insertion. Calling `first` on a hash doesn't make sense, but ruby lets you do it.

2. Notice that the return value of calling `first` on a hash with a numeric argument is a nested array. This is unexpected. Turning this nested array back to a hash is easy enough: [[:a, "ant"], [:b, "bear"]].to_h.

`first` is rarely called on hashes. 

`Enumerable#include?`

`include?` doesn't take a block, but it does require one argument. It returns `true` if the argument exists in the collection and `false` if it doesn't. 

```ruby
[1, 2, 3].include?(1)
# => true
```

When called on a hash, it only checks the keys, not the values. 

```ruby
{ a: 'ant', b: 'bear', c: 'cat' }.include?('ant')
# => false

{ a: 'ant', b: 'bear', c: 'cat' }.include?(:a)
# => true
```

`Hash#include?` is an alias for `Hash#key?` or `Hash#has_key?`. Rubyists prefer these over `include?` as they make the intention more explicit. 

If we wanted to find out if a value exists within a hash, we could use the `Hash#value?` or `Hash#has_value` methods: `hash.has_value?('cat')`. These methods have an advantage over calling the `Hash#value` method and then chaining `include?` in that there is one less method to call: `hash.value.include?('cat')`. 

** use `Hash#has_value` to see if a value is in the hash, but use the key to access it. 

### Enumerable#partition

`partition` divides up elements in the current collection into two collections, depending on the block's return value. 

```ruby
[1, 2, 3].partition do |num|
  num.odd?
end
# => [[1, 3], [2]]
```

The return value is a nested array with the inner arrays seperated based on the return value of the block. The most idiomatic way to use partition is ot parallel assign variables to capture the divided inner arrays. 

```ruby
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

odd # => [1, 3]
even # => [2]
```

Even if the collection is a hash, the return value of `partition` will always be an array. 

```ruby
long, short = { a: 'ant', b: 'bear', c: 'cat' }.partition do |key, value|
  value.size > 3
end

# => [[[:b, "bear"]], [[:a, "ant"], [:c, "cat"]]]
```

To transform these arrays back into a hash, we can invoke `Array#to_h`.

```ruby
long.to_h # => { :b => "bear" }
short.to_h # => { :a => "ant", :c => "cat" }
```

Reading the Ruby documentation helps us to understand more deeply: 

- Whether the method takes a block
- How it handles the block's return value
- What the method itself returns



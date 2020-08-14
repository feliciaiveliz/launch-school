# Sorting

Sorting is setting the order of the items in a collection according to a certain criterion. 

```ruby
[2, 5, 3, 4, 1]
[1, 2, 3, 4, 5]
```

The two arrays contain the same integers but the second array is ordered numerically. Ruby provides two methods to help us sort arrays: 

```ruby
[2, 5, 3, 4, 1].sort # => [1, 2, 3, 4, 5]
```

***

### Comparison

Sorting is carried out by *comparing* the items in a collection with each other, ordering them based on the result of that comparison. **Comparison is at the heart of how sorting works**. How does Ruby know to order items when it comes to sorting a collection?

```ruby
['c', 'a', 'e', 'b', 'd'].sort # => ['a', 'b', 'c', 'd', 'e']
```

Calling `sort` on the array of characters returns a new array of characters, ordered alphabetically. When `sort` is called on an array, it doesn't know whether that array contains integers, strings or some other type of object, so how does it know how to order the elements in the array?

It uses a method to determine this; the `<=>` method (sometimes called the "spaceship" operator).

***

### The `<=>` Method

Any object in a collection that we want to sort **must** implement a `<=>` method. This method performs *comparison* between two objects of the same type and returns a `-1`, `0`, or `1`, depending on whether the first object is **less then, equal to, or greater than** the second object; if the two objects cannot be compared then `nil` is returned. 

```ruby
2 <=> 1 # => 1
1 <=> 2 # => -1
2 <=> 2 # => 0
'b' <=> 'a' # => 1
'a' <=> 'b' # => -1
'b' <=> 'b' # => 0
1 <=> 'a' # => nil
```

The return value of the `<=>` method is used by `sort` to determine the order in which to place the items. If `<=>` returns `nil` to `sort` then it throws an argument error.

```ruby
['a', 1].sort # => # => ArgumentError: comparison of String with 1 failed
```

The `sort` method doesn't care about how `<=>` compares items, it is only concerned about the return value of the `<=>` method: `-1`, `1`, or `0`. When using `sort`, it is important to know how `<=>` performs comparison for the type of object that you want to sort. 

1. Does that object type implement a `<=>` comparison method?
2. If yes, what is the specific implementation of that method for that object type? (`String#<=>` will be implemented differently to `Integer#<=>`)

For string, docs says: 

- Comparison - Returns -1, 0, 1 or nil depending on whether `string` is less than, or equal to, or greater than `other_string`. 

***

### The ASCII Table

Concepts like greater than, less than or equal to are obvious with integers, but how does `String#<=>` understand these concepts? `String` order is determined by a character's position in the ASCII table.

It is ASCII character order that determines the result if we compare one ASCII character with another using the `String#<=>` method.

When comparing uppercase `'A'` with lowercase `'a'` it returns `-1` because `'A'` comes before `'a'` in ASCIIbetical order. 

```ruby
'A' <=> 'a' # => -1
```

`'!'` comes before `'A'`: 

```ruby
'!' <=> 'A' # => -1
```

You can determine a string's ASCII position by calling `ord` on the string: 

```ruby
'b'.ord # => 98
'}'.ord # => 125
```

`'b'` should come before `}`: 

```ruby
'b' <=> '}' # => -1
```

Rules to remember for sorting string: 

1. Uppercase letters come before lowercase letters: -1
2. Digits and (most) punctuation come before letters

***

### The `sort` Method

We can simply call `sort` on an array which returns a new array of ordered items. Comparisons are carried out using the `<=>` method on the items being sorted.

We can also call `sort` with a block; this gives us more control over how the items are sorted. The block needs **two** arguments passed to it (the two items to be compared) and the return value of the block has to be `-1`, `0`, `1` or `nil`.

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  a <=> b
end
```

We are using `Integer#<=>` in the block to perform the comparison which `sort` would have done without a block. The integers are ordered in descending order within the block.

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  b <=> a
end
# => [5, 4, 3, 2, 1]
```

You can write additional code within the block as long as it returns -1, 1, 0 or nil.

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  puts "a is #{a} and b is #{b}"
  a <=> b
end
# a is 2 and b is 5
# a is 4 and b is 1
# a is 3 and b is 1
# a is 3 and b is 4
# a is 2 and b is 1
# a is 2 and b is 3
# a is 5 and b is 3
# a is 5 and b is 4
# => [1, 2, 3, 4, 5]
```

***

```ruby
['arc', 'bat', 'cape', 'ants', 'cap'].sort
# => ['ants', 'arc', 'bat', 'cap', 'cape']
```

`'cape'` is longer and is therefore considered *greater* than `'cap'`.

There is also an `Array#<=>` method. 

```ruby
[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort

# => [["a", "car", "d"], ["a", "car", "d", 3], ["a", "cat", "b", "c"], ["b", 2]]
```

Elements are compared in an 'element-wise' manner, where the first element is compared in each array. Usually when an integer is being compared against a string object, it throws an error. Since three of the arrays start with the letter `a`, the array that contains the letter `b` is the last array and the second element of the array `2`, does not come into play.

***

### The `sort_by` Method

`sort_by` is similar to `sort` but is usually called with a block. The code within the block determines how the items will be compared.

```ruby
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end

# => ['mat', 'bed', 'cot']
```

- Here we are sorting the string based on the character at index `1` of the array. The other characters are ignored.

***

There is really no need to sort hashes since their values are accessed by their keys rather than position. Use `sort_by` to sort a hash. When calling `sort_by` on a hash, you need to pass in two arguments to the block- the key and the value. In the `people` hash below, the keys are the person's name and the values are their ages.

```ruby
people = { Kate: 27, join: 25, Mike: 18 }
```

The last evaluated argument in the block should be the thing by which we want to sort, so if we wanted to sort by age we could do this: 

```ruby
people.sort_by do |_, age|
  age
end
# => # => [[:Mike, 18], [:john, 25], [:Kate, 27]]
```

`sort_by` **always returns an array, even when called on a hash.** The result here is a new array that contains 3 subarrays, where the key-value pairs are the names and their ages. 

***

What if we wanted to sort the hash by name instead? The names in the hash are **symbols**. In order for `sort` to work, the objects to be compared must be of the same object type, and they must implement a `<=>` method. 

For symbols, `Symbol#<=>` reads that the symbols are compared *after* `to_s` is called on them, and `Symbol#to_s` says that "it returns the name or string corresponding to" the symbol.

By using `Symbol#<=>` we are effectively comparing strings. We know now that we can sort our hash by name. However, since `:john` is lowercase, it will come *after* `:Kate` and `:Mike`, which isn't what we want.

To fix this, call `Symbol#capitalize` on each within the block so that the keys are compared as capitalized names.

```ruby
people.sort_by do |name, _|
  name.capitalize
end
# => # => [[:john, 25], [:Kate, 27], [:Mike, 18]]
```

***

`Array#sort` and `Array#sort_by` have their destructive method equivalents, `Array#sort!` and `Array#sort_by!`. Instead of returning a new collection, the same collection is returned but sorted. These methods are specific to arrays and are not available to hashes. 

***

Other methods implement a `<=>` method to compare items: 

- `min`
- `max`
- `minmax`
- `min_by`
- `max_by`
- `minmax_by`
# Sorting

Sorting is mostly performed on array, since array elements are accessed by their index. Strings don't have access to sorting methods, so it's best to convert the string into an array to sort it. 

### What is Sorting?
Sorting is setting the order of the items in a collection according to a certain criterion. 

```ruby
[2, 4, 5, 1, 3]
[1, 2, 3, 4, 5]
```
These arrays contain the exact same integers but the second one is ordered numerically. To achieve a sorted array, we simply call `sort`. The return value is a **new array** with the integers ordered sequentially according to their value.

```ruby
[2, 4, 5, 1, 3].sort # => [1, 2, 3, 4, 5]
```

### Comparison

Sorting is essentially carried out by *comparing* items in a collection with each other and ordering them based on the result of that comparison. 
**Comparison is at the heart of how sorting works.**

#### How Does Ruby Know How to Sort Items in a Collection?

Example: 

```ruby
['c', 'a', 'e', 'b', 'd'].sort  # => ['a', 'b', 'c', 'd', 'e']
```
Calling `sort` on this array of characters returns a **new** array of characters, ordered alphabetically. When calling `sort` on an array, it doesn't know what the array contains, so how does it know how to order the elements in the array?

Answer: the `<=>` method or "spaceship" operator

### The `<=>` Method

Any object that we want to sort *must** implement a `<=>` method. It performs **comparison** between two objects of the **same type** and returns a `-1`, `0`, `1`, depending on whether the first object is less than, equal to, or greater than the second object. If the two objects cannot be compared, `nil` is returned. 

```ruby
first_object > second_object = 1
first_object < second_object = -1
first_object == second_object = 0
```

Examples: 

```ruby
2 <=> 1 # => 1
1 <=> 2 # => -1
2 <=> 2 # => 0
'b' <=> 'a' # => 1
'a' <=> 'b' # => -1
'b' <=> 'b' # => 0
1 <=> 'a' # => nil
```

The return value of `<=>` is used by sort to determine the order in which to place the items. If `<=>` returns `nil` to `sort` then it throws an arguments error: 

```ruby
['a', 1].sort # => ArgumentError: comparison of String with 1 failed
```

`sort` is only concerned with the return value of `<=>`, so it is only looking for 1, -1, 0 or nil. 

Questions to Ask: 
1. Does that object type implement a `<=>` comparison method?
2. If yes, what is the specific implemenation of that method for that object type? 
3. `String#<=>` will be implemented differently than `Integer#<=>`

### The ASCII Table

String order is determined by a character's position in the ASCII table. You can determine a string's ASCII position by calling `ord` on the string. 

```ruby
'b'.ord # => 98
'}'.ord # => 125

# 'b' should come before '}'

'b' <=> '}' # => -1
```

- Uppercase letters come before lowercase letters
- Digits and (most) punctuation come before letters
- There is an *extended* ASCII table containing accented and other characters that come after the main ASCII table

### The `sort` Method

We can call `sort` with a block, which gives us more control over how the items are sorted. The blocks needs **two** arguments passed to it (the two items to be compared) and the return value of the block has to be -1, 1, 0 or nil.

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  a <=> b
end
# => [1, 2, 3, 4, 5]
```

`sort` would have done the same thing without the block of code. 


By switching the order in which the items are compared, the new array is returned in descending order. 

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  b <=> a
end
# => [5, 4, 3, 2, 1]
```

You can write things in the block as long as it still returns 1, -1, 0, or nil: 

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

What does this return? 

```ruby
['arc', 'bat', 'cape', 'ants', 'cap'].sort
# => ["ants", "arc", "bat", "cap", "cape"]
```

`String#<=>` compares multi-character strings character by character, so the strings beginning with 'a' will come before those beginning with 'b'; if both characters are the same then the next characters in the strings are compared and so on. For `'cap'` and `'cape'` are equal in terms of comparable characters, but 'cape' is longer therefore it is *greater* by `String#<=>`.

There is also a `Array#<=>` method. What is returned here?

```ruby
[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort

# => [["a", "car", "d"], ["a", "car", "d", 3], ["a", "cat", "b", "c"], ["b", 2]]
```

The first element in each of the arrays is compared. Three of the arrays start with 'a' and it's first index, so these come before the array that contains a 'b' in its first index.

### The `sort_by` Method

`sort_by` is similar to `sort` but is called with a block. The code in the block determines how the items are compared. 

```ruby
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
# => ['mat', 'bed', 'cot']
```

The strings are sorted according to the character at the 1 index of each string, and the rest are ignored entirely. `sort_by` always returns an array. 


Some other methods that use `<=>` to compare objects: 

- `min`
- `max`
- `minmax`
- `min_by`
- `max_by`
- `minmax_by`


# Lesson 4 - Collections Basics

Collections are made up of individual elements. This set of notes will explain how they are structured, and how to reference and assign the individual elements within them.

#### Element Reference

##### String Element Reference

|  a   |  b   |  c   |
| :--: | :--: | :--: |
|  0   |  1   |  2   |

- Strings use integer-based index that represents each character in the string.
- Index starts counting at 0 and increments by one for the remaining values.
- Reference a specific character using the index.

```ruby
str = 'abcdefghi'

str[2] => "c"
```

- On `line 1` we initialize local variable `str` and set it to reference String object with the value of `abcdefghi`.
- On `line 3` we reference the character `c` by using its index `2`. 
- To reference more than one character, we can use an index starting point and specify the number of characters to return, all within `[]`

```ruby
str = 'abcdefghi'

str[2, 3]
```

Things to note: 

`str[2, 3]` is alternative syntax for `str.slice(2, 3)`. This is part of Ruby's syntactical sugar.

***

### Array Element Reference

|  s   |  t   |  o   |  r   |  m   |
| :--: | :--: | :--: | :--: | :--: |
|  0   |  1   |  2   |  3   |  4   |

Arrays are also ordered, zero-indexed collections. They are lists of *elements* that are ordered by index, where each element can be any object. A specific element can be referenced using its index. 

```ruby
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']

arr[2] => "c"
```

- On `line 1` we initialize local variable `arr` and set it to reference an Array object that contains `7` String objects, letters `a-g`.
- On `line 3` we use integer-based indexing to reference the character `c`, which is at position `2` in the array. 

What is output here? 

```ruby
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2, 3]
arr[2, 3][0]
```

- `c` will be returned. `arr[2, 3]` is alternative syntax for `Array#slice` method, however `Array#slice` returns a new array.
- The only time it doesn't return a new array is if we pass in only an index to the method, instead of a range or a start and length. The element at that index is returned. 

```ruby
arr = [1, 'two', :three, '4']
arr.slice(3, 1) # => ["4"]
arr.slice(3..3) # => ["4"]
arr.slice(3)    # => "4"
```

- On `lines 2-4` we are using element reference syntax of the `Array#slice` method. 

***

### Hash Element Reference

Hashes use key-value pairs instead of integer-based index. The key or value can be any type of Ruby object. 

```ruby
hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot' }

hsh['fruit']    # => "apple"
hsh['fruit'][0] # => "a"
```

- To reference the value of `apple`, use this syntax: `hsh['fruit']`. This returns the key's value.
- On `line 3` we are referencing the value of `fruit` key, which is `apple`. We use string element reference on the return value `apple` to reference the character `a`.
- When initializing a hash, the key must be **unique**. 

***

```ruby
hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }

(irb):1: warning: key :fruit is duplicated and overwritten on line 1
=> {"fruit"=>"pear", "vegetable"=>"carrot"}
```

- The first key-value pair that contains the key `fruit` is overwritten by the third because they have identical keys. 
- Values **can** be duplicated.

***

```ruby
hsh = { 'apple' => 'fruit', 'carrot' => 'vegetable', 'pear' => 'fruit' }

```

- To access just the keys or just the values of a hash, use `#keys` and `#values`. 
- These methods return an array.

```ruby
country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
country_capitals.keys      # => [:uk, :france, :germany]
country_capitals.values    # => ["London", "Paris", "Berlin"]
country_capitals.values[0] # => "London"
```

- `[0]` is referencing the item at index `[0]` of the array `["London", "Paris", "Berlin"]`, since this is the return value of `country_capitals.values`.

***

```ruby
str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e']

str[2] # => "c"
arr[2] # => "c"

str[5] # => nil
arr[5] # => nil
```

- On `line 1` we initialize local variable `str` and set it to reference String object with a value of `abcde`.
- On `line 2` we initialize local variable `arr` and set it to reference an Array object that contains `5` String objects within it, letters `a-e`.
- On `line 4` we use string element reference to reference the character `c` from the object variable `str` is pointing to. `str[2]` refers to the character at the `2` position in the string.
- On `line 5` we use array element reference to reference the element `c`. This element is at the `2` position of the array object.
- On `line 7` we try to reference a character at the `[5`] position of the String object but it returns `nil`, since this index is out-of-bounds.
- On `line 8` we try to reference an element at an index that is out-of-bounds, therefore it returns `nil`.

***

```ruby
arr = [3, 'd', nil]
arr[2] # => nil
arr[3] # => nil
```

- Since arrays can contain any type of object, including `nil`, we might not know right away if an element that is being referenced **is** `nil`, or if it's out-of-bounds so the method **returns** `nil`.
- We can use `#fetch`, which tries to return the element at position index, but throws an IndexError exception if the referenced index lies outside of the array bounds. 

```ruby
arr.fetch(2) # => nil
arr.fetch(3) # => IndexError: index 3 outside of array bounds: -3...3
             #        from (irb):3:in `fetch'
             #        from (irb):3
             #        from /usr/bin/irb:11:in `<main>'
```

- `#fetch` throws an `IndexError` exception if the index is **out of bounds**. Try to use `#fetch` because it enforces the array boundaries. 

***

### Negative Indices

Elements in `String` and `Array` objects can be referenced using negative indices. They start from the last index in the collection `-1` and work backwards.-

|  a   |  b   |  c   |
| :--: | :--: | :--: |
|  0   |  1   |  2   |
|  -3  |  -2  |  -1  |

***

```ruby
str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

str[-6]
str[-6]
```

- `Line 4` returns `nil`.
- `Line 5` returns `nil`.

```ruby
arr.fetch(-6) # => IndexError: index -6 outside of array bounds: -5...5
              #        from (irb):2:in `fetch'
              #        from (irb):2
              #        from /usr/bin/irb:11:in `<main>'
```

***

### Invalid Hash Keys

Hash has a `#fetch` method that can be useful when trying to disambiguate valid hash keys with a `nil` value from invalid hash keys.

```ruby
hsh = { :a => 1, 'b' => 'two', :c => nil }

hsh['b']       # => "two"
hsh[:c]        # => nil
hsh['c']       # => nil
hsh[:d]        # => nil

hsh.fetch(:c)  # => nil
hsh.fetch('c') # => KeyError: key not found: "c"
               #        from (irb):2:in `fetch'
               #        from (irb):2
               #        from /usr/bin/irb:11:in `<main>'
hsh.fetch(:d)  # => KeyError: key not found: :d
               #        from (irb):3:in `fetch'
               #        from (irb):3
               #        from /usr/bin/irb:11:in `<main>'
```

- `c` and `:d` are invalid keys; using `#fetch` can help to differentiate the two

***

### Conversion

`String#chars` returns an array of individual characters.

```ruby
str = 'Practice'

arr = str.chars # => ["P", "r", "a", "c", "t", "i", "c", "e"]
```

- On `line 1` we initialize local variable `str` and set it to reference the String object with value of `Practice`.
- On `line 3` we initialize local variable `arr` and set it to reference the return value of invoking `String#chars` method on the object `str` variable is referencing. 
- This returns an array of individual characters: `["P", "r", "a", "c", "t", "i", "c", "e"]`.

`Array#join` returns a string with the elements of the array joined together. 

```ruby
arr.join # => "Practice"
```

- On `line 1` we invoke `Array#join` on the Array object `arr` is referencing, returning a string with those elements joined together. 

***

The `Hash#to_a` method returns an array: 

```ruby
hsh = { sky: "blue", grass: "green" }
hsh.to_a # => [[:sky, "blue"], [:grass, "green"]]
```

- On `line 1` we initialize local variable `hsh` and set it to reference a hash that contains two key-value pairs. The first key-value pair is `sky: 'blue'` and the second is `grass: 'green'`.
- On `line 2` we invoke the `Hash#to_a` method on the hash local variable `hsh` is referencing, returning a new array containing two subarrays. Each subarray contains a symbol and a string. These subarrays are equivalent to a key-value pair from the initial hash. 

***

`Array` has a `to_h` method that returns a hash.

```ruby
arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]
arr.to_h # => {:name=>"Joe", :age=>10, :favorite_color=>"blue"}
```

- This returns a hash where each key-value pair contains the elements of each subarray.

***

### Element Assignment

#### String Element Assignment

```ruby
str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"
```

- On `line 1` we initialize local variable `str` and assign it to a String object with a value of `joe's favorite color is blue`.
- On `line 2` we use string element assignment to convert the first letter of the String object to its uppercase equivalent. 
- On `line 3` we output the value of `str`, which is now `Joe's favorite color is blue`.
- String element assignment mutates the string object in place.

***

#### Array Element Assignment

We can assign elements in an array in the same way we would do strings.

```ruby
arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr         # => [2, 2, 3, 4, 5]
```

- The statement `arr[0] += 1` is shorthand for `arr[0] = arr[0] + 1`.
- This combines array element reference and array element assignment. This is Ruby's syntactical sugar.

***

### Hash Element Reference

The hash key is used for hash element reference instead of assigning a value using an index.

```ruby
hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh # => { :apple => "Fruit", :carrot => "Produce", :pear => "Produce", :broccoli => "Produce" }
```

- hsh[:apple] = 'Fruit'
- hsh[:carrot] = 'Vegetable'
- hsh[:pear] = 'Fruit'
- hsh[:broccoli] = 'Vegetable'
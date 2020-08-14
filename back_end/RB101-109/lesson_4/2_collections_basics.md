# Collections Basics

Collections are made up of individual elements. To work with collections, we need to understand how they are structured and how to reference and assign the individual elements within them.

## Element Reference
String Element Reference: 

| a | b | c |
|---|---|---|
| 0 | 1 | 2 |

Strings use an **integer-based index** that represents each character in the string. The index starts at 0 and increments by one for the rest of the index values. To reference a specific character, use its index.

```ruby
str = 'abcdefghi'

str[2] # => 'c'
```

To reference multiple characters within a string, start with an **index starting point** and then the **number of characters** to return:

```ruby
str[2, 3] # => 'cde'
```

*Things to be aware of*
- str[2, 3] is actually a call to the #slice method of String and is alternative syntax for str.slice(2, 3). This is Ruby's syntactical sugar. Check documentation.

- Methods in ruby always have a return value. When we call a method, We can use *method chaining* to call another method on the return value. 

Example: 

```ruby
str[2, 3][0] # => 'c'
```
Here we are calling [0] on the return value of str[2, 3] (which is 'cde'), so this is the same as 'cde'[0].

How do you reference 'grass' from within this string? 

```ruby
str = 'The grass is green'
str[4, 5] # => 'grass'
```

## Array Element Reference
Like strings, arrays are also **ordered, zero-indexed** collections.

Arrays are lists of *elements* that are ordered by index, where each element can be any object. Arrays use an integer-based index to maintain the order of its elements. A specific element can be reference using its index. 

```ruby
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']

arr[2] # => 2
```

What will be returned here? 

```ruby
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2, 3]     # => ['c', 'd', 'e']
arr[2, 3][0]  # => 'c'
```

Just like String, `arr[2, 3]` is alternative syntax for the Array#slice method. Those methods are **not** the same however, even though they have the same name. They share some of the same functionality but are seperate implementations. String#slice returns a **new string** whereas Array#slice returns a **new array**.

One situation where Array#slice doesn't return a new array is if we pass the method only an index instead of a range, or a start and length. The element at that index is returned rather than a new array.

```ruby
arr = [1, 'two', :three, '4']
arr[3, 1]  # => ['4']
arr[3..3]  # => ['4']
arr[3]     # => '4'
```

We are using the element reference syntax of the Array#slice method. Even though these three method calls target the same element of `arr` (the string `'4'` at index 3), the first two method calls return that the element inside of a new array, whereas the third one just returns the element itself. 

When calling methods such as this on a collection object like an array, it is important to be aware of **exactly what is returned**, as this will affect how you can subsequently interact with that return value. 

## Hash Element Reference

Hashes are another very common data structure collection that uses **key-value pairs** instead of integer-based index. The key or the value can be any type of ruby object. This allows for more expansive and descriptive collection of elements. 

```ruby
hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot' }

hsh['fruit']     # => 'apple'
hsh['fruit'][0]  # => 'a'
```

It is important to note that the `[0]` part of `hsh['fruit'][0]` in the example is **string element reference**. The string `'apple'` is returned by `hsh['fruit']` and `[0]` is called on that return value. 

When initializing a hash, the keys must be **unique**:

```ruby
hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }

(irb):7: warning: key "fruit" is duplicated and overwritten on line 7
=> {"fruit"=>"pear", "vegetable"=>"carrot"}
```

The hash ends up with only two key-value pairs. The first one is over-written by the third as they have identical keys. 

Values **can** be overwritten: 

```ruby
hsh = { 'apple' => 'fruit', 'carrot' => 'vegetable', 'pear' => 'fruit' }
```
We can access just the keys or just the values from a hash with the `#keys` and `#values` methods of `Hash`. These methods return an array:

```ruby
country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
country_capitals.keys      # => [:uk, :france, :germany]
country_capitals.values    # => ["London", "Paris", "Berlin"]
country_capitals.values[0] # => "London"
```

`[0]` is referencing the item at index `[0]` of the array `['London', 'Paris', 'Berlin']` since this is the return value of `country_capitals.values`.

 - The example uses symbols as keys. Keys and values can both be of any object, however it is common practice to use symbols as keys.     Symbols in ruby can be thought of as immutable strings. 

## Element Reference Gotchas
There are a few things to be aware of when you are referencing elements in a collection. Be aware of these to avoid unintended behavior in your code. 

#### Out of Bounds Indices
Strings and arrays are **indexed collections** and that we can reference individual elements within the collection via their index. 

```ruby
str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e']

str[2]  # => 'c'
arr[2]  # => 'c'
```

The indices of both collections run from `0` to `4`. What happens if we try to reference an element with an index greater than `4`?

```ruby
str[5] # => nil
arr[5] # => nil
```

Referencing an out-of-bounds index in this way returns `nil`. For strings, `nil` is an invalid return value; in arrays, `nil` could be a valid return value since arrays can contain any other type of object, including `nil`. 

```ruby
arr = [3. 'd', nil]
arr[2]  # => nil
arr[3]  # => nil
```
How can we tell the difference between the valid return and the out-of-bounds reference?

Array has a method called #fetch that:

 > Tries to return the element at position index, but throws an IndexError exception if the referenced index lies outside of the array bounds. 

```ruby
arr.fetch(2)  # => nil
arr.fetch(3)  # => IndexError: index 3 outside of array bounds: -3...3
              #        from (irb):3:in `fetch'
              #        from (irb):3
              #        from /usr/bin/irb:11:in `<main>'
```

`#fetch` throws an IndexError exception if the index is **out of bounds**. Which is better to use? `#[] or #fetch`? `#[]` occurs most in ruby, but it's better to use `#fetch` since it enforces the array boundaries. Be careful when `#[]` returns `nil`. Think about whether `nil` is the real element in the array or if it's ruby's way of telling us we've gone beyond the array boundary. 

#### Negative Indices

What if we use an index less than `0`?

```
str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e']

str[-2] # => 'd'
arr[-2] # => 'd'
```
Elements in `String` and `Array` objects can be referenced using negative indices, starting from the last index in the collection `-1` and working backwards. 

| a | b | c |
|---|---|---|
| 0 | 1 | 2 |
| -3| -2| -1|

What will be returned by the following calls? 

```ruby
str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

str[-6] # => nil
arr[-6] # => nil
```

These negative indices are out of bounds.

Confirm using #fetch: 

```ruby
arr.fetch(-6) # =>  # => IndexError: index -6 outside of array bounds: -5...5
```

#### Invalid Hash Keys
`Hash` also has a #fetch method which can be useful when trying to figure out valid hash keys with a `nil` value from invalid hash keys:

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

In the example, both the string `'c'` and the symbol `:d` are invalid keys; the string `'b'` and the symbol `:c` are valid keys. Keys and values can be of any object. When referencing an item by its key you must use the correct object type. 

## Conversion

It's common practice to convert strings to arrays and arrays to strings. 

`String#chars` returns an array of individual characters:

```ruby
str = 'Practice'

arr = str.chars # => ["P", "r", "a", "c", "t", "i", "c", "e"]
```

`Array#join` returns a string with the elements of the array joined together: 

```ruby
arr.join # => "Practice"
```

Try this: 

```ruby
str = 'How do you get to Carnegie Hall?'
arr.str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join      # => "HowdoyougettoCarnegieHall?"
```

How do you get the original string with spaces between each word?

```ruby
arr.join(' ')

# or

arr[0] + ' ' + arr[1] + ' ' + arr[2] + ' ' + arr[3] + ' ' + arr[4] + ' ' + arr[5] + ' ' + arr[6]

```

Hash has a `#to_a` method, which returns an array. 

```ruby
hsh = { sky: 'blue', grass: 'green' }
hsh.to_a # => [[:sky, "blue"], [:grass, "green"]]
```

Each sub-array is equivalent to a key-value pair from the hash and contains a symbol and a string. 

`Array` has a `#to_h` method:

```ruby
arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]
arr.to_h # => { :name => 'Joe', :age => 10, :favorite_color => 'blue' }
```
## Element Assignment

#### String Element Assignment

To change the value of a specific character within a string, we can refer to its index and use **element assignment notation**. To change the first letter of the first word in a sentence to its uppercase equivalent, do this:

```ruby
str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favortie color is blue"
```

*To allow for the single quote mark inside the sentence, you surround the entire sentence in double quote marks. To change the first letter of every word in the sentence, do this:

```ruby
str = "joe's favorite color is blue"
str[0] = 'J'
str[6] = 'F'
str[15] = 'C'
str[21] = 'I'
str[24] = 'B'
str
```

*Note that this is a destructive ation; the `str` is changed permanently.*

#### Array Element Assignment

We can assign elements in an array the same way: 

```ruby
arr = [1, 2, 3, 4, 5]
arr[0] += 1  # => 2
arr          # => [2, 2, 3, 4, 5]
```

*This is shorthand for `arr[0] = arr[0] + 1`. This combines array element **reference** and array element **assignment** and is another example of ruby syntactical sugar. 

Use the same method to increase the rest of the values in the array by `1`. 

```ruby
arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
arr  # => [2, 3, 4, 5, 6]
```

*Note that this is a destructive action that permanently modifies `arr`.*

#### Hash Element Assignment

Hash element assignment is similar. The hash key is used instead of assigning a value using an index. 

```ruby
hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh # => # => { :apple => "Fruit", :carrot => "Produce", :pear => "Produce", :broccoli => "Produce" }
```
Use the same method to set a value of either 'Fruit' or 'Vegetable' to each element in the hash. 

```ruby
hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh[:carrot] = 'Vegetable'
hsh[:pear] = 'Fruit'
hsh[:broccoli] = 'Vegetable'
hsh # => # => { :apple => "Fruit", :carrot => "Vegetable", :pear => "Fruit", :broccoli => "Vegetable" }
```

#### Summary 
We talked about quite a few important topics in this assignment. More specifically, we covered the core ways to reference elements or assign values for particular elements in a collection using some of the various element reference and element assignment methods of String, Array and Hash.

These concepts are fundamental to working with collections so it's critical to understand everything we talked about in this assignment before moving forward. Taking the time to have a clear understanding of these topics will make it much easier to handle topics that build upon these fundamentals in the future.


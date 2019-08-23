# Nested Data Structures

```ruby
arr = [[1, 3], [2]]
```
Here we have an array that contains two seperate array: `[1, 3]` and `[2]`. Each inner array still has its own index. Each inner array can be accessed in the same way that you access any other array element. 

### Accessing Array Elements

This is how to access the first inner array: 

```ruby
arr = [[1, 3], [2]]
arr[0] # => [1, 3]
```

This is how to retrieve the second element from the first nested array: 

```ruby
arr = [[1, 3], [2]]
arr[0] # => [1, 3]
arr[0][1] # => 3  # it returns the integer
```

### Updating Collection Elements

This is how to update array elements: 

```ruby
arr = [[1, 3], [2]]
arr[1] = 'hi there'
arr  # => [[1, 3], 'hi there']
```

The `arr[1] = 'hi there'` is destructive, therefore it permenantly changes the second element of the first array. We can do the same thing for a nested array: 

```ruby
arr = [[1, 3], [2]]
arr[0][1] = 5
# => [[1, 5], [2]]
```

The first part `arr[0]` is element reference, while the second part is element update.

This is how to insert an additional item into a nested array: 

```ruby
arr = [[1], [2]]

arr[0] << 3
arr # => [[1, 3], [2]]
```

The first part is element reference and the second part is destructively appending `3` into the inner array. We can also add another inner: 

```ruby
arr = [[1], [2]]

arr[0] << [3]
arr # => [[1, [3]], [2]]    # three-layer nested data structure
```

### Other Nested Structures

Hashes can also be nested into an array: 

```ruby
[{ a: 'ant', { b: 'bear' }]
```

This is how to add a new key/value pair into the first inner hash: 
The first part is element reference and the second part is updating the hash. This is also destructive: 

```ruby
arr = [{ a: 'ant', b: 'bear' }]

arr[0][:c] = 'cat'
arr # => [{ :a => "ant", :c => "cat" }, { :b => "bear" }]
```

Arrays can hold multiple diffent objects at the same time, including nested data structures. 

```ruby
arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab']

arr[0]          # => ['a', ['b']]
arr[0][1][0]    # => 'b'
arr[1]          # => { :b => 'bear', :c => 'cat' }
arr[1][:b]      # => 'bear'
arr[1][:b][0]   # 'b'
arr[2][2]       # 'b'
```

### Variable Reference for Nested Collections

It can get confusing when trying to figure out when a variable is referencing inner collections directly:

```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr # => [[1, 3], [2]]
```
The local variables `a` and `b` are pointing to `Array` objects. If we changed the value that `a` is pointing to, `arr` is changed too. This is because `a` is still pointing to the *same Array object* that's in `arr`. If we modify `arr` directly, it is the same result. Both `arr` and `a` are modified. This is two ways to modify the object. 

### Shallow Copy 

Sometimes we want to copy an entire collection to save it before performing any major modifications to it. Ruby provides two methods for that: 

- `dup`
- `clone`

Both of these create a shallow copy of an object, which means that only the object that the method is called on is copied. If the object contains other objects- like a nested array- then those objects will be **shared**,not copied. 

`dup` allows objects within the copied object to be modified. 

```ruby
arr1 = ['a', 'b', 'c']
arr2 = arr1.dup
arr2[1].upcase!

arr2 # => ['a', 'B', 'c']
arr1 # => ['a', 'B', 'c']
```

`clone` works the same way: 

```ruby
arr1 = arr1.clone
arr2[0].reverse!

arr2 # => ['cba', 'def']
arr1 # => ['cba', 'def']
```

In both examples, `arr1` and `arr2` are changed. The reason is because the destructive methods String#upcase! and String#reverse! were called on the object *within* the array rather than the array itself. Since those objects are *shared*, even if you mutate that object by referencing it from within a particular array or collection, it is the **object** you are affecting rather the collection. 

Examples: 

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

arr1 # => ["a", "b", "c"] # left unmodified
arr2 # => ["A", "B", "C"] # changed Array


arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!  # called on each element of arr2
end

arr1 # => ["A", "B", "C"] 
arr2 # => ["A", "B", "C"] # every element is a reference to the object refereced by the corresponding element in arr1
```

### Freezing Objects

The main difference between `dup` and `clone` is that `clone` preserves the *frozen state of the object**. In Ruby, objects can be frozen in order to prevent them from being modified. 

```ruby
arr1 = ['a', 'b', 'c'].freeze
arr2 = arr1.clone
arr2 << 'd'
# => RuntimeError: can't modify frozen Array
```

`dup` doesn't preserve the frozen state of the object.

```ruby
arr1 = ['a', 'b', 'c'].freeze
arr2 = arr1.dup
arr2 << 'd'

arr2 # => ["a", "b", "c", "d"]
arr1 # => ["a", "b", "c"]
```

```ruby
str = 'abc'.freeze
str << 'd'
# => RuntimeError: can't modify frozen String
```

Only mutable objects can be frozen because immutable objects, like integers, are already frozen. Check if an object is frozen with the `frozen?` method:

```ruby
5.frozen? # => true
```

#### What does freeze actually freeze? 

`freeze` only freezes the **object it's called on**. If the object it's called on contains other objects, those objects won't be frozen. If we have a nested object, the objects within in it can still be modified after freezing. 

```ruby
arr = [[1], [2], [3]].freeze
arr[2] << 4
arr # => [[1], [2], [3, 4]]
```
 This also applies to strings within an array: 

 ```ruby
 arr = ['a', 'b', 'c'].freeze
 arr[2] << 'd'
 arr # =>  => ["a", "b", "cd"]
```


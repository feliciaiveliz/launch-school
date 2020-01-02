# Nested Data Structures

```ruby
arr = [[1, 3], [2]]
         0      1     # index of outer array
        0  1    0     # indexes of inner arrays
```

This one array contains two inner subarrays: `[1, 3]`, and `[2]`. Each inner array has its own index. 

To retrieve the first inner array: 

```ruby
arr[0] # => [1, 3]
```

To retrieve the integer `3`, we need to chain our references: 

```ruby
arr[0][1] # => 3
```

***

### Updating Collection Elements

To update collection elements: 

```ruby
arr = [[1, 3], [2]]
arr[1] = 'hi there'
arr      # => [[1, 3], 'hi there']
```

- The `arr[1] = 'hi there'` is a destructive action that permanently changes the second element in the `arr` array.

We can also modify a value in a nested array: 

```ruby
arr = [[1, 3], [2]]
arr[0][1] = 5
arr # => [[1, 5], [2]]
```

- The first part, `arr[0]` is element reference, while the second `[1] = 5` is element update. This is a permanent change. 

***

To insert an additional element into an array, we have to chain the element reference with appending an element.

```ruby
arr = [[1], [2]]

arr[0] << 3
arr # => [[1, 3], [2]]
```

- The first part is element reference: `arr[0]` and the second part is a destructive action, appending `3` to the array `[1, 3]`.

***

To add on another array: 

```ruby
arr = [[1], [2]]

arr[0] << [3]
arr # => [[1, [3]], [2]]
```

- This is now a 3-layer nested array.

***

### Other Nested Structures

Hashes can be nested within an array. 

```ruby
[{ a: 'ant' }, { b: 'bear' }]
      0               1
```

- First step: reference the first element in the array
- Second step: update the hash

```ruby
arr = [{ a: 'ant' }, { b: 'bear' }]

arr[0][:c] = 'cat'
arr # => [{ :a => "ant", :c => "cat" }, { :b => "bear" }]
```

- First: retrieve the first inner hash, so we get ` {a: 'ant'}`
- Then use normal hash key-value creation syntax to create a new key-value pair. This change is destructive.

***

Array objects can contain multiple objects within it, even nested data structures: 

```ruby
arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab']

arr[0]              # => ["a", ["b"]]
arr[0][1][0]        # => "b"
arr[1]              # => { :b => "bear", :c => "cat" }
arr[1][:b]          # => "bear"
arr[1][:b][0]       # => "b"
arr[2][2]           # => "b"
```

***

### Variable Reference for Nested Collections

It can be confusing when we don't know when variables are referencing inner collections directly. 

```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr # => [[1, 3], [2]]
```

- Local variables `a` and `b` are referencing `Array` objects. When we put the local variables as elements in an array, it looks the same as adding the actual `Array` objects that they're referencing into the array. 

What happens if we modify `a` after placing it in `arr`? 

```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr # => [[1, 3], [2]]

a[1] = 5
arr # => [[1, 5], [2]]
```

The value of `arr` because `a` still points the *same `Array` object* that's in `arr`. When we modified it by replacing `3` with `5`, we were modifying the `Array` object. 

```ruby
a = [1, 3]      a -----> [1, 3]
b = [2]         b -----> [2]

arr = [a, b]    arr ---> [1, 3] <---- a
                         [2]    <---- b
a[1] = 5        arr ---> [1, 5] <---- a
                         [2]    <---- b
```

What if we modify the first array in `arr`? 

```ruby
arr[0][1] = 8
arr # => [[1, 8], [2]]
a   # => [1, 8]
```

- It produces the same result as modifying `a` directly. 
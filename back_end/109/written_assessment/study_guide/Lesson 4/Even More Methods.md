# More Methods

```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```

- The return value of `select` in this example is `[1, 2, 3]`. 
- `'hi'` is the last evaluated line of code within the block and is a truthy value. Since `select` considers the truthiness of a block's return value, it uses that as selection criteria to select all elements of the original array.

***

```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```

- The return value of this code example is `2`. `count` only counts an element if the block's return value evaluates to true. `count` considers the truthiness of the block's return value.

***

```ruby
[1, 2, 3].reject do |num|
  puts num
end
```

- The return value of `reject` in this code is `[1, 2, 3]`.
- `reject` selects an element and puts it into a new array if the return value of the block evaluates to `false` or `nil`.

***

```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```

- The return value of `each_with_object` in this code is `{ 'a' => 'ant', 'b' => 'bear', 'c' => 'caterpillar' }`.
- `each_with_object` here returns a hash object, `{}`, that gets updated after every iteration. `each_with_object` takes a block as well as an argument, in this case `{}`. 

***

```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```

- `shift` here destructively removes the first key-value pair in `hash` and returns it as a two-element array.

***

```ruby
['ant', 'bear', 'caterpillar'].pop.size
```

- The return value of this code example is `11`.
- We call `pop` on the array object which destructively removes the last element of an array and returns it, which is `'caterpillar'`.
- We call `size` on the return value of `pop`, which returns an integer that represents the number of characters that are in the string, in this case `11`.

***

```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

- The block's return value is `false`, a boolean. The return value of `any?` is therefore `true`. The output of the code is `1`, since `any?` stopped iterating after this point.

***

```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```

- `take` takes an argument that represents how many elements to remove from the array. In this case only `2`, so this code returns `[1, 2]`.
- It is not destructive.

***

```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

- The return value of `map` here is `[nil, 'bear']`. The code within the block returned a `false` value so `value` isn't returned. `nil` is returned and is put into a new array by `map`.

***

```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

- The return value of this code is `[1, nil, nil]`. For the first element, `1`, the `if` condition evaluates to `false` so `num` was returned. For `2` and `3`, `puts num` was evaluated, therefore `nil` was returned. 
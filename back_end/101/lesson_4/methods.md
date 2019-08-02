## Methods

Using loops such as `loop` or `for`, to iterate over a collection can become very repetitive. Ruby makes working with collections easier with built-in methods. We'll look at `each`, `select`, and `map`. 

 - each

The most effective option for iterating over a collection is to use a loop: 

```ruby
numbers = [1, 2, 3]
counter = 0

loop do 
  break if counter == numbers.size
  puts numbers[counter]
  counter += 1
end
```

The `each` method is functionally equivalent to using `loop` and represents a simpler way of accomplishing the same task. This is an examples that produces the same result as the implementation above: 

```ruby
[1, 2, 3].each do |num|
  puts num
end
```
`each` is a method that is called on an array and it takes a block: do...end. The code within the block is executed for each iteration. The `puts num` means that each element in the array will be output by the `puts` method. How does the block know what `num` is? For each iteration `each` sends the value of the current element to the block in the form of an argument. In this block, the **argument** to the block is `num` and it represents the value of the current in the array. Since we are working with an array, `each` knows that there's only one element per iteration, so `each` sends the block only one argument, `num`. Hashes need two arguments in order to represent both the key and the value per iteration. Calling `each` on a hash looks a little different, since the block has two arguments: 

```ruby
hash = { a: 1, b: 2, c: 3 }

hash.each do |key, value|
  puts "The key is #{key} and the value is #{value}"
end
```

We can use either `loop` or `each` to iteration over a collection. The main difference is the return value. Once `each` is done iterating, it **returns the original collection**. 

```ruby
[1, 2, 3].each do |num|
  puts num
end

1
2
3
=> [1, 2, 3]
```

Note: `[1, 2, 3].each` is the last expression in the example, despite there being code in the block. The return result of the entire expression is the return value of the `each` invocation, which is the original collection `[1, 2, 3`].

We can see another example of this by placing `each` within a method. The return value of `a_method` is the return value of the last expression within the method. In the example, we've slightly changed what happens in the block; now `puts` is outputting the number for each iteration multiplied by 2. 

When calling the method, we see that the return value is `[1, 2, 3]`. This is because the last expression in the method is `[1, 2, 3].each`, which has a return value of `[1, 2, 3]`.

```ruby
a_method # => [1, 2, 3]
```

What if we added a statement after `#each`? What will the return value of `a_method` be? 

```ruby
def a_method
  [1, 2, 3].each do |num|
    puts num * 2
  end

  puts 'hi'
end
```

The return value is now `nil` because the return value of `puts` is always `nil` and that statement is the last expression in the method. 

```ruby
a_method # => nil
```

## Select

Arrays and hashes have built-in methods to iterate over a collection and perform selection: through a `select` method that makes doing this much easier. Instead of managing a loop manually with a counter and break condition, we can do this: 

```ruby
[1, 2, 3].select do |num|
  num.odd?
end
```

To perform selection, `select` evaluates the **return value of the block**. The block returns a value on each iteration, which then gets evaluated by `select`. Similar to a real method, the return value of the block is the return value of the last expression within the block.

When evaluating the block's *return's value*, `select` only cares about its *truthiness*. Everything in Ruby is considered 'truthy' except for `nil` and `false`. It's not the same as saying everything except `nil` and `false` has a value of `true` in Ruby, but only that it is 'truthy'. 

If the return value of the block is 'truhty', then the element during that iteration will be selected. If the return value of the block is 'falsey', then the element will not be selected. 

```ruby
[1, 2, 3].select do |num|
  num + 1
end
```

The return value of this block will always be a 'truthy' value because everything is 'truthy' except `false` or `nil`. Here, the return value will always be an integer because `num + 1` is the last expression within the block, so the block implicitly returns an integer, a truthy value. 

What will the return value of `select` be? `select` performs selection based on the truthiness of the block's return value. If the block's return value is always 'truthy', then all of the elements will be selected. When an element is selected, it *returns a new collection* containing all of the selected elements, because the selection  criteria -- the blocks' return value -- is truthy for every element in the array. 

```ruby
[1, 2, 3].select do |num|
  num + 1
end
[1, 2, 3]
```

When working with `select` it's **important to always be aware of the *return value* of the block. Example: if we place the statement `puts num` on the last line within the block, how will that affect the return value of `select`?

```ruby
[1, 2, 3].select do |num|
  num + 1
  puts num
end
```

`select` will now return an empty array. Since `puts num` is now the last evaluated expression in the block, it is the return value of this expression which determines the return value of the block. `puts` always returns `nil` therefore the return value of the block will now be `nil`, which is considered 'falsey' value. `select` won't select *any* elements because the return value will *always* be falsey. 

```ruby
irb :001 > [1, 2, 3].select do |num|
irb :002 >   num + 1
irb :003 >   puts num
irb :004 > end
1
2
3
=> []
```

## Map

Similar to `select`, `map` also considers the return value of the block. The main difference is that map uses the return value of the block to perform transformation instead of selection.

```ruby
[1, 2, 3].map do |num|
  num * 2
end
```

The return value of the block is the product of `num` and `2`. `map` then takes this value and place it in a **new collection**. This process is repeated for each element in the original collection. 

```ruby
irb :001 > [1, 2, 3].map do |num|
irb :002 >   num * 2
irb :003 > end
=> [2, 4, 6]
```

```ruby
[1, 2, 3].map do |num|
  num.odd?
end
```

Remember that `map` *always performs transformation based on the return value of the block*. In this case, the return value of the block will be a boolean, which means that the collection returned by `map` will be an array of booleans. 

```ruby
irb :001 > [1, 2, 3].map do |num|
irb :002 >   num.odd?
irb :003 > end
=> [true, false, true]
```

What will be the return value of `map` in the following example? 

```ruby
[1, 2, 3].map do |num|
  num.odd?
  puts num
end
```

The return value of the block will always be `nil`. `map` doesn't care about truthiness, and takes this return value as the transformation criteria. The collection returned by map is a new array of `nil`s. 

```ruby
irb :001 > [1, 2, 3].map do |num|
irb :002 >   num.odd?
irb :003 >   puts num
irb :004 > end
1
2
3
=> [nil, nil, nil]
```

What if the only statement within the block is a string? What is the return value of `map`?

```ruby
[1, 2, 3].map do |num|
  'hi'
end
```
`'hi'` is the last statement in the block which means map will use that as the transformation criteria. It will return an array of `'hi'`. 

```ruby 
irb :001 > [1, 2, 3].map do |num|
irb :002 >   'hi'
irb :003 > end
=> ["hi", "hi", "hi"]
```

*Note*: certain collection types have access to specific methods for a reason. 

## Summary

Methods like `each`, `select`, and `map` are provided by Ruby to allow for simpler implementations of common collection manipulation tasks. Using these methods to iterate, select, and transform a collection is preferred over manual looping. In the case of `each`, the return value of the block is ignored. 

# Looping

It's common to perform a single action on each element in a collection. Loops can be useful to perform an action on many or all elements in a collection, instead of having to write out the action many times. In the previous assignment, we saw how to increment all the integers by `1`. 

```ruby
arr = [1, 2, 3, 4, 5]
arr[0] += 1
arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
arr # => [2, 3, 4, 5, 6]
```

Lines 2 through 6 are nearly identical. This would be okay for a small array, but will require much more repetitive lines of code for largers arrays. We can use a loop to help.

```ruby
arr = [1, 2, 3, 4, 5]
counter = 0

loop do
  arr[counter] += 1
  counter += 1
  break if counter == arr.size
end

arr # => [2, 3, 4, 5, 6]
```

### Controlling a Loop

In ruby, a simple loop is created by calling the `Kernel#loop` method and passing a block to it. Any code within the block will be executed each time the loop performs an iteration. `loop` is in the `Kernel` module, so it's available everywhere, just like `puts` and `gets`.

In this loop, `'Hello!'` will be printed an infinite number of times:

```ruby
loop do 
  puts 'Hello!'
end
```

The reserved word `break` should be put after `puts 'Hello!'` so that the loop can iterate only once. When `break` is executed, it exits the nearest loop. 

```ruby
loop do
  puts 'Hello!'
  break
end
```

If we want `loop` to iterate more than once, we can use a **conditional statement** so that `break` is only called when a specific condition occurs. Here we have a variable named `number` that represents a random number. We can choose to exit the loop when `number` equals `5` by writing the `if` condition as `number == 5`. 

```ruby
loop do
  number = rand(1..10) # a random number between 1 and 10
  puts 'Hello!' # will print out 'Hello!' on each line
  if number == 5 # Conditional to break out of loop when it is met
    puts 'Exiting..' # statement to print when condition is met
    break # reserved word used to exit loop
  end
end
```

LS Notes:

 - 'Hello!' is output one or more times
 - 'Exiting...' is output once

On each iteration: 
 - number is assigned to a random number between 1 and 10
 - 'Hello!' is output
 - The if statement checks if number is equal to 5
   - If so 'Exiting...' is output and break is called (which ends the loop)
   - If not then the loop repeats

#### Iteration
Even though we have an `if` condition for `break`, we don't know how many times the loop will iterate because `number` represents a random number. We can tell `loop` to iterate a specific number of times by using a **variable that tracks the number of iterations performed**. Before `loop` is implemented, we need to assign a variable `counter` that represents the current iteration number. 

In order to align the value of `counter` and the number of iterations, we need to increment `counter` by `1` during each iteration. This will ensure that `loop` only iterates five times. 

```ruby
counter = 0

loop do
  puts 'Hello!'
  counter += 1
  break if counter == 5
end
```

*Note that `counter` is initialized **outside** of the loop. If it was initialized inside of the loop it would be reassigned to `0` on each iteration and the `break` condition would never be met.

#### **if modifier**

The `if` statement can be shortened by changing it to an `if` modifier. An `if` modifier is implemented by appending the keyword `if` and the condition to a statement. The statement here is `break`.

```ruby
break if number == 5
```

This makes the code more readable but should only used when applicable. If there are multiple lines of code within the `if` statement then a modifier can't be used.

#### Break Placement

When `break` is placed on the last line within the loop, it mimics the behavior of a 'do/while' loop. With a 'do/while' loop, **the code within the block is guaranteed to execute at least once**. The `while` keyword **always precedes a condition**. If the `break` is moved to the first line within the loop, then it will mimic the behavior of a `while` loop. If the condition evaluates to `true`, the loop will exexute the code within the block. If it evaluates to `false`, the loop will stop. **This means that the code under the `break` may or may not execute at all**, depending on the condition. 

If we move `break` to the first line within the loop and change the condition to `counter == 0`, then the loop will stop immediately and not execute any more code. 

```ruby
counter = 0

loop do
  break if counter == 0
  puts 'Hello!'
  counter += 1
end
```

#### Next

`next` is used to help control loops. When `next` is executed, it tells the loop to skip the rest of the current iteration and begin the next one. We can choose to skip the current iteration when `counter` represents an odd number by adding an `if` modifier to `next` with the condition `counter.odd?`

*`#odd?` is a method of `Integer` which returns `true` if an integer is odd and `false` if it isn't.*

```ruby
counter = 0

loop do
  counter += 1
  next if counter.odd?
  puts counter
  break if counter > 5
end
```

When we added `next`, we also had to move `counter += 1` so that it's executed first. Similar to `break`, when `next` is executed, any code after it will be ignored. If the `counter` incrementation code was placed after `next`, then it wouldn't be incremented if `next` is executed, which will result in an infinite loop. The `if` condition also had to be changed from `counter == 5` to `counter > 5` since 5 is an odd number. 

#### Iterating Over Collections

We'll look at how to use loops to iterate over collections. 

### String

Implement a loop that iterates over a string and prints each character. 

```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'
counter = 0

loop do 
  break if counter == alphabet.size
  puts alphabet[counter]
  counter += 1
end
```

To print each character in the string, we need to iterate over the entire string, and use string reference to retrieve each letter based on index. Since our `counter` starts at `0`, we can just use that. Then we'll `break` out of the loop when the counter equals the length of the `alphabet` string. 

*`String#size` returns the number of characters in the given sring. You could also use `String#length`.

To print a specific character in a string, we use the index value associated with the specific character. Since `counter` represents the current iteration number, we can use its value as the index value for each character. This results in every character being printed one at a time. 

The ordering of `counter += 1` and our `break` modifier doesn't matter too much. Using a more general condition in our `if` modifier would work better. `break if counter >= alphabet.size` guarantees that we break out of the loop regardless of whether `counter` is exactly equal to `alphabet.size` or not. 

What if it contained spaces? Strings can only contain characters, so a space is also a character. If the string was 'a b c', each character would be printed, including the spaces. 

```ruby
a

b

c
```

### Array
To iterate over an array, we can use `loop` in the same way we did a string. 

```ruby
colors = ['green', 'blue', 'purple', 'orange']
counter = 0

loop do 
  break if counter == colors.size
  puts "I'm the color #{colors[counter]}"
  counter += 1
end
```
We'll modify the array so that it contains various types of objects. We'll modify `puts` so that it prints the name of the class of each object. We can call the `class` method which returns the name of the calling objects's class. 

```ruby
objects = ['hello', :key, 10, []]
counter = 0

loop do 
  break if counter == objects.size
  puts objects[counter].class
  counter += 1
end
```
Output: 

```ruby
String
Symbol
Integer
Array
```

#### Hash

Using `loop` to iterate over a hash is a little more difficult. Hashes use key-value pairs instead of a zero-based index. This means that each value in a hash is aassociated with a specific key. Since hash keys can be any type of object, a simple counter variable won't allow us to fetch the values we want: 

```ruby
number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}

pets = number_of_pets.keys # => ['dogs', 'cats', 'fish']
counter = 0

loop do
  break if counter == number_of_pets.size
  current_pet = pets[counter]
  current_pet_number = number_of_pets[current_pet]
  puts "I have #{current_pet_number} #{current_pet}!"
  counter += 1
end
```
 We have to create an array containing all of the keys in the hash. We can do this by using `Hash#keys`, which returns an array containing all of the keys in the hash. We then use this new array of keys, `pets`, to iterate over the hash.

 First, we iterate over the array of keys, `pets`, and save each key into the `current_pet` variable. We then use the `current_pet` key to retrieve the appropriate value out of the `number_of_pets` hash. 

 The `puts` statement interpolates both the current hash value, `current_pet_number`, and the current hash key, `current_pet`, into the "I have ...!" string. 

 ```ruby
 I have 2 dogs!
 I have 4 cats!
 I have 1 fish!
 ```

### Summary

Looping comprises of four basic elements: a loop, a counter, a way to retrieve the current value, and a way to exit the loop. 
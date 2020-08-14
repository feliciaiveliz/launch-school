# Coding Tips 2

*bad

```
name = ''
puts "Enter your name: "
loop do
  name = gets.chomp
  break unless name.empty?
  puts "That's an invalid name. Try again:"
end
puts "Welcome #{name}"
puts "What would you like to do?"
```

*Better practice of using newlines to seperate the code 

```
name = ''

puts "Enter your name: "
loop do 
  name = gets.chomp
  break unless name.empty?
  puts "That's an invalud name. Try again:"
end

puts "Welcome #{name}!"
puts "what would you like to do?"
```
Visually you can see where 'name' variable is initialized. The code is divided in three parts:

1. variable initializing
2. user input and validation
3. using the variable

#### Should a method return or display?
 * Understand if a method returns a value, or has side effects, or both. 
 * Side effects means either displaying something to the output or mutating an object. 

```
# side effect: displays to the output
# returns: nil

def total(num1, num2)
  puts num1 + num2
end

# side effect: mutates the passed-in array
# returns: updated array

def append(target_array, value_to_append)
  target_array << value_to_append
end
```

Example of method with no side effects:

```
# side effects: none
# returns: new integer

def total(num1, num2)
  num1 + num2
end
```

Paying attention to methods and their side effects vs return values is critical to writing code that easy to read and well organized. 
Try to avoid methods that return something and has side effects. 

#### Name Methods Appropriately
Choose good method names to help you remember what each method does. If you have methods that output values, then use method names that start with 'display_' or 'print_'. Those shouldn't return anything. 
 * Methods need to be improved if you're constantly looking at the implementation to recall how to use it.
Methods should do only one thing and be named appropriately.
A method called 'total' should return a value, and a method called print_total should return nil. If it's called 'total!'then there must be a side effect somewhere.

#### Don't mutate the caller during iteration
If we have an array of strings that we want to iterate over and print out each element, do this: 

```
words = %w(scooby doo on channel two)
words.each {|str| puts str}
```
Now to mutate the elements in the array and add a "!" after each word.

```
words = %w(scooby doo on channel two)
words.each {|str| str << '!'}
puts words.inspect   # => ['scooby!', 'doo!', 'on!', 'channel!', 'two!']
```
We aren't mutating the 'words' object. We aren't adding or removing elements from words. We are mutating each element within the words array. 
Suppose we want to remove the element as we're iterating:

```
words = %w(scooby doo on channel two)
words.each {|str| words.delete(str)}
puts words.inspect       # => ['doo', 'channel']
```

* Don't mutate a collection while iterating through it.

You can mutate the individual elements within that collection, just not the collection itself. There will be unexpected behavior.

#### Variable Shadowing 
This occurs when you choose a local variable in an inner scope that shares the same name as an outer scope. This prevents you from accessing the outer scope variable from an inner scope.
Suppose there's an array of names and we wanted to append a last name to them: 

```
name = 'johnson'

['felicia', 'camille', 'kayla'].each do |name|
  # we cannot access the outer scoped 'name'
  puts "#{name} #{name}"
end
```
Within the each code block, the name represents the elements in the array - 'felicia', 'camille', 'kayla'.
This is *not* variable shadowing:

```
name = 'johnson'

['felicia', 'camille', 'kayla'].each do |fname|
  name = fname
end
```
The codd is accessing the outer scope 'name' variable and re-assigning it. After the 'each' block, the 'name' will be set to 'sam'
* Be careful about choosing appropriate block variables(the thing between | |) when working with blocks. If you pick a name that is identical to an outer scope variable, variable shadowing will prevent you from using the outer scope variable. 

#### Dont' Use Assignment in a Conditional
Never use an assignment in a conditional. 

```
# bad

if some_variable = get_a_value_from_somewhere
  puts some_variable
end

# good

some_variable = get_a_value_from_somewhere
if some_variable
  puts some_variable
end
```

This is confusing for yourself and others who are reading your code. 
This is a while loop that iterates through a collection: 

```
numbers = [1, 2, 3, 4, 5]

while num = numbers.shift
  puts num
end
```

The Array#shift method removes and returns the first element in the array. When there's nothing to remove, shift returns nil. This loop serves as the loop termination condition. 
While it works, the problem is that the code is hard to read. 
If you must do it, wrap the assignment in parentheses. 

```
numbers = [1, 2, 3, 4, 5]

while (num = numbers.shift)
  puts num
end
```

#### Use underscore for unused parameters
Suppose you have an array of names and you want to print out a string for every name in the array, but don't care about the actual names. Use an underscore to signify that we don't care about this parameter. 

``` 
names = ['felicia', 'camille', 'kayla']
names.each { |_| puts "got a name!" }
```
Or if you have an unused parameter when there are multiple parameters: 

```
names.each_with_index do |_, idx|
  puts "#{idx+1}. got a name!"
end
```


## Pry

What is debugging?

Bugs are human errors in code. It is the process of identifying and fixing those errors. 

How do we debug code?

1. Identify the problem
2. Understand the problem
3. Implement the solution

Types of Errors

1. Syntax Errors- error in writing of code. It can be a missing character or keyword that can stop the code from running. The code written does not conform to the grammar of the programming language you are using.

2. Logical Errors- Code will generally run without raising an exception, but the result is not what was expected. The error is in the logic of the code

What is pry?
1. Pry is a rubygem. Install it using 'gem install pry'
2. It has to be required at the top of the file to use it- require 'pry'
3. REPL- READ-EVALUATE-PRINT-LOOP
4. It is an interactive environment that
  - takes user input
  - evaluates the input
  - returns the results back to the user
  - loops back to the start

Using Pry
1. Works simliar to irb
2. Ability to change scope

Invoking Pry at Runtime
- Using binding.pry
  - A binding is something that contains references to any variables that were in scope at the point where it was created
  - `pry` interrupts program execution and **pries open** the binding so that we can look around

#### Example 1: 

```ruby 
a = true

if a  # syntax error - use double quotes to surround string or escape charater
  puts 'It's true!'
end
```

#### Example 2: 

```ruby
puts "Please pick an option: 1 or 2"
user_input = gets.chomp # input comes in as string and needs to be converted to integer for it to be compared properly to other integers

if user_input == 1
  puts "You picked option 1"
elsif user_input == 2
  puts "You picked option 2"
else
  puts "Invalid option!!"
end
```

#### Example 3:
```ruby
loop do 
  p eval gets # gets part is 'READ' part of repl
end
```

#### Example 4: 

```ruby
require 'pry'
a = 1
b = 2
binding.pry
c = 3
```

The `binding.pry` has access to variables that are in its scope below but does not have access to the value assignments that come below it. It's important to know where to put the binding.pry. 

#### Example 5: 
```ruby
require 'pry'

def my_method(num)
  a = 1
  binding.pry
  b = 2
end

c = 3
my_method(c)
```

`binding.pry` shows us that `a = 1`, `b` is `nil` and it throws an exception when it gets to c because it is out of scope for the method.

#### Example 6: 
```ruby
require 'pry'

def double_num(num)
  num * 2
end

arr = [1, 2, 3].map do |num|
  double_num(num)
  binding.pry
end

p arr
```

To see array of `nils` in the array that is returned by `arr`, you have to type `exit` 3 times, as this represents the number of instances that occur for this loop. 

#### Example 7: 
```ruby
require 'pry'

a = 0
b = 0

loop do 
  a += 1
  binding.pry
  b += 1
  break if b >= 3
end

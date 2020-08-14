# Pseudo-Code Practice Problems

Write a method that returns the sum of two integers.

Pseudo-Code: 

```
- ask user for two numbers that will be added together
- save first number into variable for future use
- save second number into variable for future use
- add the two numbers together and save it into variable
- display result of addition
```

More detail: 

```
START

PRINT "What is the first number?"
GET first number from user, convert to integer using #to_i
SET first_number = first number

PRINT "what is the second number?"
GET second number from user, convert to integer using #to_i
SET second_number = second number

SET sum = first_number + second_number
PRINT sum
```

Code: 

```ruby
puts "What is the first number?"
first_number = gets.chomp.to_i

puts "What is the second number?"
second_number = gets.chomp.to_i

sum = first_number + second_number
puts sum
```

***

Write a method that takes an array of strings and returns a string that is all those strings concatenated together. 

Pseudo-Code

```
Given an array of strings.

- create an empty string to hold new concatenated string
- iterate through array of strings
  - on each iteration, append the string with a space added to it
- return new string
- display string
```

More detail: 

```ruby
Given an array of strings. 

START

SET new_string to an empty string
SET iterator variable to 0 (first element of array)
WHILE iterator <= size of the array
  new_string + ' ' + word
PRINT new_string to user
```

Code: 

```ruby 

```


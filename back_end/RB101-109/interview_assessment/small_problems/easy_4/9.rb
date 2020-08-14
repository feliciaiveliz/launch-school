=begin

In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

input: integer
output: string
rules: 
- can't use Integer#to_s
- 0 is '0'
data structure: hash, array
pseudo-code: 
- create a hash that contains keys that integer (symbols) and values that are the string 
- create an empty string variable called 'string'
- initialize variable 'str'
- convert the integer into an array of seperate integers
- iterate over the array 
- map each integer to its string equivalent
- push this to new string
- return new string 
algorithm: 
- init. hash called STRINGS 
  - 0: => '0', 1: '1'
- init. variable 'string' that will hold new string value
- init. 'chars' variable and set it to converting the integers
  to an array of int. and reversing them so order is preserved
- use #map to iterate over array and map the digits to their strs
- push these new string values to the 'string' variable
- return 'string'
=end

STRINGS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 
            6 => '6', 7 => '7', 8 => '8', 9 => '9' }

def integer_to_string(number)
  string = ""
  number.digits.reverse.map { |char| string << STRINGS[char] }
  string
end

# or 

def integer_to_string(number)
  number.digits.join.reverse
end


p integer_to_string(4321) 
p integer_to_string(0) 
p integer_to_string(5000) 

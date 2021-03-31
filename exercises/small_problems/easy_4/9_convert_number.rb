=begin
Write a method that takes a positive integer or zero, and converts it to a string representation.
You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, 
String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the 
string by analyzing and manipulating the number.

input: integer
output: string
rules: 
- integers may be positive or zero
- may not use convention string conversion methods
- assume all characters are numeric
examples: 
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'
data structure: array, hash
algorithm: 
- create STRINGS hash to hold strings for each letter
- create integer_to_string method to map each integer to a string
- call digits.reverse on integers to place them in an array in correct order
- call map to map them to string representation and save to number_strings variable 
- return strings variable
- create string variable
- enter loop to iterate through array and append string values in order
- string << number_strings.shift
- return string variable
=end

STRINGS = {
 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 
 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' 
}

def integer_to_string(numbers)
  string = ''
  numbers.digits.reverse.each do |num|
    string << STRINGS[num]
  end
  string
end

def integer_to_string(integer)
  integer.digits.reverse.join # first try, but thought it was too easy
end

p integer_to_string(4321)
p integer_to_string(0)
p integer_to_string(5000)


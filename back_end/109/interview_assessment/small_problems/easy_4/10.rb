=begin

In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

input: integer
output: string
rules: 
- if number positive, return +number
- if number negative, return -number
- if number 0, return '0'
- can't use Integer#to_s, Integer() or format
data structure: string
pseudo-code: 
- use previous method, integer_to_string
- define signed_integer_to_string(number)
-use if/else statement
 - if number.positive? then +number
- else -number
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

def signed_integer_to_string(number)
  return '0' if number.zero?
  if number.positive?
    "+#{integer_to_string(number)}"
  elsif number.negative?
    "-#{integer_to_string(number.abs)}"
  end
end

# or

def signed_integer_to_string(number)
  return '0' if number.zero?
  sign = number > 0 ? '+' : '-'
  sign + integer_to_string(number.abs)
end


p signed_integer_to_string(4321) == "+4321"
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

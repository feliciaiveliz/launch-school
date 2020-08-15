=begin
Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as 
Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.
 
input: integers
output: string
rules: 
- if number is positive, prepend + sign
- if number is negative, prepend - sign
- if 0, no sign
examples: 
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'
algorithm: 
- define signed_integer_to_string method w/ 'number' param 
- save abs_string var to integer_to_string.abs
- return '0' if number is 0
- ternary- if number is positive? then "+{abs_string}" otherwise "-{abs_string}"
=end

def integer_to_string(numbers)
  numbers.digits.reverse.join # first try, but thought it was too easy
end

def signed_integer_to_string(number)
  abs_string = integer_to_string(number.abs)

  case
  when number < 0 then "-#{abs_string}"
  when number > 0 then "+#{abs_string}"
  else abs_string
  end
end

# Refactored
def signed_integer_to_string(number)
  abs_string = integer_to_string(number.abs)
  return '0' if number.zero?
  number.positive? ? "+#{abs_string}" : "-#{abs_string}"
end

p signed_integer_to_string(4321)
p signed_integer_to_string(-123)
p signed_integer_to_string(0)

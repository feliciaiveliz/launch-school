=begin

Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

input: integer
output: integer
rules: 
- reverse the digits
examples: 
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1
data structure: integer
pseudo-code: 
- convert integers into an array of digits
- convert the array into a string of digits
- convert the string into an integer with digits that are reversed
algorithm: 
- convert integer using #digits
- convert array using #join
- convert string using #to_i
=end

def reversed_number(number)
  number.digits.join.to_i
end

def reversed_number(number)
  number.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

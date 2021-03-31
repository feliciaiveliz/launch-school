=begin

Write a method that takes a positive integer as an argument and returns that number with its digits reversed.

input: positive integer
output: positive integer
rules: 
- if integer ends with zero, return value will not include zeros
examples: 
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1
data structure: array, string, integer
algorithm: 
- def reversed_number(digits)
- initialize number variable and save result of calling #digits on digits
  - number = [5, 4, 3, 2, 1]
- call #join to return a string of reversed digits, call #to_i to convert to integer
- end method
=end

def reversed_number(numbers)
  numbers.digits.join.to_i
end

def reversed_number(numbers)
  numbers.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
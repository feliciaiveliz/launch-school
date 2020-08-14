=begin

Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

input: number
output: array of digits
rules: 
- number will be positive
- order must be preserved from number
data structure: array
pseudo-code: 
- split the number into invididual digits
- if order of number is not preserved, sort it
algorithm: 
- define digit_list method and pass in a parameter, numbers
- invoke #digits on the integer to convert to an array of digits
- invoke #reverse to convert it back to its original order
- end method

- convert number to a string using #to_s
- invoke #chars to convert it to an array of individual strings
- invoke #map to iterate over this array and convert each string to an integer
- use &:to_i
=end


def digit_list(number)
  number.digits.reverse
end

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

=begin

Write a method that takes one argument, a positive integer, and returns the sum of its digits

input: positive integer
output: integer 
rules: 
- number will be positive
- number can contain underscores
data structure: array, integer
pseudo-code: 
- convert integer into an array of integers
- add all the numbers in array
- return that number
algorithm: 
- invoke #digits on integer to convert to array
- invoke #sum on that array to return integer value 
=end

def sum(number)
  number.digits.sum
end

# or

def sum(number)
  sum = 0
  str_digits = number.to_s.chars

  str_digits.each do |str_digit|
    sum += str_digit.to_i
  end
  sum
end

# or

def sum(number)
  number.to_s.chars.map(&:to_i).inject(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
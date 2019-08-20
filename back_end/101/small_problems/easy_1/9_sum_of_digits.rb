# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

=begin

Inputs: 
- a positive integer

Outputs: 
- return sum of all digits
- integer

Examples: 
- puts sum(23) = 5
- puts sum(496) == 19
- puts sum(123_456_789)

Data Structure: 
- array
- methods

Algorithm: 
- create method called sum(numbers)
- call .digits.sum 
- end method

Algorithm 2: 
- create method called sum(numbers)
- call to_s on digits
- split digits into array of strings
  - chars
- use map method to convert strings into integers
  - [1, 2, 3]
- use Array#sum method for addition
  - numbers.sum 
  - returns sum as integer
- end method
=end 

def sum(numbers)
  numbers.digits.sum
end
  
def sum(numbers)
  numbers.to_s.chars.map(&:to_i).reduce(:+)
end
  
puts sum(23)
puts sum(496)
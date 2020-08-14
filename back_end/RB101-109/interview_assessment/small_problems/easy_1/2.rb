=begin

Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

input: integer
output: boolean
rules: 
- integer can be positive, negative or zero
- only return true if absolute value of integer is odd
- return false if integer is 0
pseudo-code: 
- if the integer's absolute value is odd, return true
- if its absolute value is even, return true
algoritm: 
- define is_odd? method and pass in one parameter- number
  - call #abs on integer to return its abs value
  - if integer mod 2 is equal to 1, then its odd; therefore true
  - if integer mod 2 is not equal to 1, then its even; false
=end

def is_odd?(number)
  number.abs % 2 == 1 
end

def is_odd?(number)
  number.abs.remainder(2) == 1
end


puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
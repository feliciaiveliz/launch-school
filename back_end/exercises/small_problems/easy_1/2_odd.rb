# Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.
# Not allowed to use #odd? or #even? in solution.

=begin
Inputs: 
- one integer argument
  - positive, negative, zero

Outputs: 
- returns boolean value of true or false
  - true if number's absolute value is odd
  - false if number's absolute value is even
  
Rules: 
- cannot use #odd? or #even? methods

Examples/Test Cases:
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

Data Structure:
- modulo operator
- Integer#abs

Algorithm:
- call #abs on the integer to make sure the division works 
- use % to determine what the remainder of a number is: ex. 3 % 2
- if integer % 2 == 0 then false
- if integer % 2 == 1 then true 
=end

def is_odd?(num)
  num.abs % 2 != 0
end
  
  puts is_odd?(2)   
  puts is_odd?(5)    
  puts is_odd?(-17)  
  puts is_odd?(-8)
  puts is_odd?(0)    
  puts is_odd?(7)    
  
  # Further Exploration. The Integer#remainder method performs a remainder operation in Ruby. Rewrite #is_odd? to use Integer#remainder instead of %. Note: before version 2.4, Ruby used the Numeric#remainder method instead.
  
  def is_odd?(num)
    num.abs.remainder(2) == 1 
  end
  
  puts is_odd?(2) 
  puts is_odd?(5)   
  puts is_odd?(-17)  
  puts is_odd?(-8)   
  puts is_odd?(0)    
  puts is_odd?(7) 
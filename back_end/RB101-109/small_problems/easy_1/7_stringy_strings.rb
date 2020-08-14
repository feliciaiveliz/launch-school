# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

=begin

Inputs: 
- positive integer

Output:
- return a string of alternating 1s and 0s
- string always starts with 1
- length of string should match given integer

Rules: 
- string must start with 1
- input comes in as integer and must output as a string
- if number is an even number, string starts with 1 and ends in a 0
- if number is an odd number, string starts with a 1 and ends with a 1

Examples: 
- puts stringy(6) == '101010' => true
- puts stringy(4) == '1010' => true
- puts stringy(7) == '1010101' => true
- puts stringy(1) == '1' => true

Data Structure: 
- array
- times method

Algorithm: 
- create method called stringy
  - takes one argument - integer
- create empty array called - binary_nums = []
- use integer.times method to iterate over number
- assign return value of the block parameter |number|: even or odd, to numbers variable
  - numbers = number.even? ? 1 : 0 
    - it will assign either 1 or 0 based on current number, to numbers, and this will get added to binary_nums one by one
  - binary_nums << numbers
  - end times method
- binary_nums.join
=end

def stringy(integer)
  binary_nums = []
    
  integer.times do |num|
    number = num.even? ? 1 : 0
    binary_nums << number
  end
  
binary_nums.join
end
  
# This strategy just deals with a string and an integer. It tests to see if the number is even, (with #times, iteration starts at 0) and adds '1' to the string if it's even, and '0' to the string if it's odd.
# Return the string itself
  
def stringy(integer)
  string = ''
  integer.times do |num| 
    num.even? ? string << '1' : string << '0'
  end
string
end  
    
    
    
puts stringy(4)
puts stringy(7)
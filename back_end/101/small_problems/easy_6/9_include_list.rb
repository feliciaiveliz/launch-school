=begin

Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

input: array, search value
output: boolean
rules: 
- returns true if search value is in array
- returns false otherwise
examples: 
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false
data structure: array
algorithm: 
- define include?(array, value) method
- iterate over array
- array.each { |num| if num == value return true }
- end method 
=end 

def include?(array, value)
  array.one? { |num| num == value }
end

p include?([1,2,3,4,5], 3)
p include?([1,2,3,4,5], 6)
p include?([], 3)
p include?([nil], nil)
p include?([], nil)

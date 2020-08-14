=begin

Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

input: array, integer
output: boolean
rules: 
- cannot use #include?
- integer is search value
data structure: array
pseudo-code: 
- iterate over the array
- if the current item is equal to search value, true
- if not, false
algorithm: 
- iterate using #each
- true if item == search_value 
- false
=end

def include?(array, search_value)
  array.each do |item|
    return true if item == search_value
  end
  false
end

def include?(array, value)
  !!array.find_index(value)
end

def include?(array, value)
  array.count(value) > 0
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
=begin

Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers.

input: array of integers
output: integer
rules: 
- average is calc. by adding all nums in a collection and dividing that sum by 
  the number of digits in the collection
- array will never be empty
- numbers will always be positive
data structure: array, integer
pseudo-code: 
- add up all the numbers in the array 
- divide that number by the number of digits in the array
- return that value
alogirthm: 
- invoke #sum on the array to add all numbers
- divide that value by size of array 
=end

def average(array)
  array.sum / array.size
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
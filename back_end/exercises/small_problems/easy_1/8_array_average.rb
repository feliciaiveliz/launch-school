# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers.

=begin

Inputs: 
- an array of integers
  - integers will always be positive
  - array will never be empty

Outputs:
- returns an average (integer) - sum of all integers 
  - divide by length of array - integer

Examples: 
- puts average([1, 5, 87, 45, 8, 8]) == 25
- puts average([9, 47, 23, 95, 16, 52]) == 40

Data Structure: 
- array
- variables

Algorithm: 
- create method called average
  - one argument called array
- call #sum on array - array.sum
  - this will return a sum of integers as an integer
- find the average
  - divide result by length of array
  - result / array.length
- return average
- end method
=end

def average(array)
  array.sum / array.length.to_f
end
      
  puts average([1, 5, 87, 45, 8, 8])
  puts average([9, 47, 23, 95, 16, 52])
  
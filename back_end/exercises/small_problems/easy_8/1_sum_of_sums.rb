=begin

Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

input: array of numbers
output: integer
rules: 
- return value is sum of sums of each leading subsequence of array
- start with first integer, then add that integer to the next, then continue
- array will contain at least one integer
examples: 
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35
data structure: array, integer
algorithm: 
- define sum_of_sums(array) method
- assign to 'sum' variable 0, as starting value
- call #size and #times to iterate over the array for the length of the array
- iterate over array, incremementing 'sum' by calling #inject(:+) on the array
- pop off last element of array to work backwards and adding the result to sum
- end method
- return sum 
=end 

def sum_of_sums(array)
  sum = 0
  array.size.times do
    sum += numbers.inject(:+)
    array.pop
  end
  sum
end

def sum_of_sums(array)
  sum = 0
  accumulator = 0
  
  array.each do |num|
    accumulator += num
    sum += accumulator
  end
  sum
end

p sum_of_sums([3, 5, 2]) 
p sum_of_sums([1, 5, 7, 3])
p sum_of_sums([4])
p sum_of_sums([1, 2, 3, 4, 5])
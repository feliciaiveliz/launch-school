=begin

Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

input: an array
output: integer
rules: 
- array will contain at least one number
- return sum of sums of each subsequence of that array
examples: 
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35
data structure: array, integer
pseudo-code: 
- create variable called 'sum' and set it to 0
- create variable called 'accumulator' and set it to 0
- iterate over the array, passing each number to the block
- add the current number to the 'accumulator' and assign it back to 'accumulator'
- reassign the value of 'accumulator' to 'sum'
- 'accumulator' is creating the subsequences and holding the sums of each
- 'sum' is calculating the total sums of all of them together
- return the total sum
algorithm: 
- init. variable 'sum' assign it to 0, sum = 0
- init. variable 'accumulator', accumulator = 0
- iterate over array using #each, pass 'number' to the block
- increment 'accumulator' by the 'number' and assign it back to 'accumulator'
  - accum. = 1, accum. = 1 + 2, accum. = 1 + (1 + 2) + (1 + 2 + 3), etc.
- increment 'sum' by 'accumulator', sum += accum.
  - sum = 1, sum = 4, sum = 11, etc.
- return 'sum'
=end

def sum_of_sums(array)
  accumulator = 0
  sum = 0

  array.each do |number|
    accumulator += number
    sum += accumulator
  end
  sum
end

# or 

def sum_of_sums(array)
  sum = 0
  1.upto(array.size) do |current_size|
    sum += array.slice(0, current_size).inject(:+)
  end
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35


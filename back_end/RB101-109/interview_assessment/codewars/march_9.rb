=begin

Problem 1: Sum of Minimums!

Given a 2D list of size m * n. Your task is to find the sum of minimum value in each row.

input: array of arrays
output: integer, minimum sum
data structure: integers, array
problem: 
- what should be done with input?
  - sort each array from smallest to largest
  - grab minimum numbers from each array
  - add together for sum
algorithm: 
- sort each subarray using #sort!
- use #first to retrieve first ele. of array
- sum the array of smallest integers
- return sum
=end

def sum_of_minimums(numbers)
  numbers.map { |array| array.sort.first }.sum
end

p sum_of_minimums([[1, 2, 3, 4, 5], [5, 6, 7, 8, 9], [20, 21, 34, 56, 100]]) == 26
p sum_of_minimums([[7, 9, 8, 6, 2], [6, 3, 5, 4, 3], [5, 8, 7, 4, 5]]) == 9

=begin

Problem 2: Count the Divisors of a Number

Count the number of divisors of a positive integer n.
Random tests go up to n = 500000.

input: integer
output: integer, number of divisors
problem: 
- what should be done with the input?
  - create a range from 1 to number
  - select numbers from range that are divisors of n
    - number that can be divided evenly by n- result in 0
  - count the divisors
algorithm:
- create range 1 to n
- iterate over range:
  - select number if n mod number is equal to 0
- given array of divisors, count using #size
=end

(1..n).select { |x| n % x == 0 }.size

# or 

(1..n).count { |x| n % x == 0 }


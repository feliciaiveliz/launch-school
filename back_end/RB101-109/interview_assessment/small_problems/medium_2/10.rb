=begin

Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

input: positive integers
output: integer
rules: 
- difference calculation: 
  - sum of first 'n' integers - 
    sum of squares of 'n' integers
algorithm: 
- create varible called sums, set to 0
- create variable called squared_sums, set to 0
- from 1 up to 'n'
  - increment sum by 'n' 
  - square the total
- from 1 up to 'n'
  - square each number
  - add it to squared_sums
- calculate difference of sum - squared_sums
=end

def sum_square_difference(n)
  sums = 0
  squared_sums = 0

  1.upto(n) { |num| sums += num }
  1.upto(n) { |num| squared_sums += num ** 2 }
  
  sums = sums ** 2
  sums - squared_sums
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
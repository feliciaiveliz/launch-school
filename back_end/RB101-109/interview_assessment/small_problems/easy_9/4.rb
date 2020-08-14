=begin

Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

input: integer
output: array of integers
rules: 
- start sequence from 1 up to the argument
- argument will be valid integer
- integer will be greater than 0
data structure: array, integer
pseudo-code: 
- capture values in a range
- convert range to an array
algorithm: 
- from 1 to argument, (1..number)
- call #to_a to convert to array
=end

def sequence(n)
  (1..n.abs).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-3) == [1, 2, 3]
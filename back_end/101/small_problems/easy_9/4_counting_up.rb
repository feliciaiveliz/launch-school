=begin

Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.
You may assume that the argument will always be a valid integer that is greater than 0.

input: integer
output: array of integers
rules: 
- array of integers will start from 1 upto given number
examples: 
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]
data structure: array
algorithm: 
- define sequence method that passes in number parameter
- create an empty array called array
- use # upto method to count up to the given number
  - 1.upto(number) {|num| array << num }
- return array
- end
=end

def sequence(number)
  array = []
  1.upto(number) {|num| array << num }
  array
end

# I forget that you can convert a range to an array. 

def sequence(number)
  (1..number).to_a   # [1 2 3 4 5] 
end

p sequence(5) 
p sequence(3) 
p sequence(1)

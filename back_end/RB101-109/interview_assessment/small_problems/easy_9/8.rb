=begin

Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

input: two integers
output: array
rules: 
- first number is 'count', which is # of elements that should be in array
- second number are the values, each element will be multiples of second number
data structure: array, integer
pseudo-code: 
- size, multiples
- create variable called 'sum'
- create an empty array called 'count'
- from 1 up to 'size'
  - increment the sum by the multiple
  - add that sum to the array
algorithm: 
- init. variable - sum = 0
- init. empty array - count = []
- use a range to capture values from multiple, to size
- use #map to iterate 
- increment the sum by the multiple
- return the array
=end

def sequence(size, start)
  sum = 0
  array = []
  size.times { array << sum += start }
  array
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

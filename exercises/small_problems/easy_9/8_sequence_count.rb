=begin

Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

input: two integers
output: array of elements that match count
requirements: 
- first argument is a count
- second argument is the first number of a sequence
- array will contain same # of elements as count arg
- values of each element will be multiples of starting number
- multiples are numbers that divide evenly 
examples: 
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []
data structure: array
algorithm: 
- define sequence method with first and second num parameters
- create empty array called number_list
- set 'number' variable to 'first' - this is starting number
- invoke #times on count method
- inside the block, append each number to the array
- increment 'number' by 'first'
- return number_list array
=end

def sequence(count, first)
  number_list = []
  number = first

  count.times do 
    number_list << number
    number += first
  end

  number_list
end

# or

def sequence(count, first)
  (1..count).map {|value| value * first}
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
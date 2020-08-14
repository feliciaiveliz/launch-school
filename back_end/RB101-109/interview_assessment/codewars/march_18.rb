# # You are given a list/array which contains only integers (positive and negative). Your job is to sum only the numbers that are the same and consecutive. The result should be one list.

# def sum_consecutives(s)
#   array = s.chunk { |n| n }.to_a

#   array.map! do |arr|
#     arr.last
#   end

#   array.map do |arr|
#     arr.inject(:+)
#   end
# end

# def sum_consecutives(s)
#   array = s.chunk { |n| n }.to_a

#   array.map { |arr| arr.last }.map { |arr| arr.inject(:+) }
# end

# def sum_consecutives(s)
#   s.chunk { |n| n }.map { |array| array.last.inject(:+) }
# end

def sum_consecutives(array)
  previous = 0
  result = []

  array.each do |num|
    if num == previous
      result[-1] += num
    else
      previous = num
      result << num
    end
  end
  result
end


# p sum_consecutives([1,4,4,4,0,4,3,3,1]) == [1,12,0,4,6,1]
# p sum_consecutives([1,1,7,7,3]) == [2,14,3]
# p sum_consecutives([-5,-5,7,7,12,0]) == [-10,14,12,0]
# p sum_consecutives([3,3,3,3,1]) == [12, 1] 
# p sum_consecutives([2,2,-4,4,5,5,6,6,6,6,6,1]) == [4, -4, 4, 10, 30, 1]
# p sum_consecutives([1,1,1,1,1,3]) == [5, 3]
# p sum_consecutives([1,-1,-2,2,3,-3,4,-4]) == [1, -1, -2, 2, 3, -3, 4, -4]

# Problem 2: Simple Consecutive Pairs | 7 kyu

# In this Kata your task will be to return the count of pairs that have consecutive numbers as follows:
# The pairs are selected as follows [(1,2),(5,8),(-4,-3),(7,6),5]
# --the first pair is (1,2) and the numbers in the pair are consecutive; Count = 1
# --the second pair is (5,8) and are not consecutive
# --the third pair is (-4,-3), consecutive. Count = 2
# --the fourth pair is (7,6), also consecutive. Count = 3. 
# --the last digit has no pair, so we ignore.

=begin

PROBLEM - 
input: array of integers: poisitive, negative, 0
output: integer, # of consecutive pairs
question: what should be done with input?
- split into into smaller arrays: 
  - each array will contain 2 numbers
  - if there's odd amount of #s in array, last array will contain 1 digit
- check each array to see if the two numbers are consecutive pairs
- count the number of pairs
ALGOIRTM: 
- until array is empty?
  - use #slice and remove two integers, put them into array
- with array of pairs: 
  - count pairs of consecutive values
    - a, b: take a - b == 1 or a + b == 1
=end

def pairs(array)
  pairs = []
  pairs << array.slice!(0, 2) until array.empty?
  pairs.select! { |pair| pair.size == 2 }
  pairs.select do |pair|
    (pair[0] - pair[1] == 1) || (pair[1] - pair[0] == 1)
  end.count
end
p pairs([1,2,5,8,-4,-3,7,6,5]) #== 3



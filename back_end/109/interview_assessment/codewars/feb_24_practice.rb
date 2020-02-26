=begin

Given two integers a and b, which can be positive or negative, find the sum of all the numbers between including them too and return it. If the two numbers are equal return a or b.
Note: a and b are not ordered!

input: two integers, positive or negative
output: integer, positive or negative
rules:
- if a and b are same, return a
- include a and b in the sum
problem: 
- given two numbers: 
  - put numbers in order: smallest to largest
  - create a range between number
- add all numbers from start to end
- return the sum
algorithm:
- if a is equal to b, return a
- create a range: 
  - if a > b, switch places of a and b in a range
    - b to a
    - a to b, inclusive
- create variable sum, set it to zero
- iterate: 
  - increment sum by current number
- return sum
=end

def get_sum(a, b)
  return a if a == b
  if a > b 
    range = (b..a).to_a
  else
    range = (a..b).to_a
  end

  sum = 0

  range.each do |n|
    sum += n
  end

  sum
end

p get_sum(1, 0) == 1   # 1 + 0 = 1
p get_sum(1, 2) == 3   # 1 + 2 = 3
p get_sum(0, 1) == 1   # 0 + 1 = 1
p get_sum(1, 1) == 1   # 1 Since both are same
p get_sum(-1, 0) == -1 # -1 + 0 = -1
p get_sum(-1, 2) == 2  # -1 + 0 + 1 + 2 = 2

################################################

=begin

Problem: Form The Minimum

Given a list of digits, return the smallest number that could be formed from these digits, using the digits only once (ignore duplicates).

input: array of integers
output: integer
rules: 
- only positive integers
- return smallest digit
- ignore the duplicate numbers
data structure: array, integers
problem: 
- remove duplicate integers
- sort integers from smallest to largest numbers
algorithm: 
- filter out dups. using #uniq
- sort from a <=>
- join the array into a string
- convert string into integer
- return minimum value
=end

def min_value(array)
  array.uniq.sort.join.to_i
end

p min_value([1, 3, 1]) == 13
p min_value([4, 7, 5, 7]) == 457
p min_value([4, 8, 1, 4]) == 148

######################################

=begin

Problem: Maximum Triplet Sum (Array Series #7)

Given an array/list [] of n integers , find maximum triplet sum in the array Without duplications .

input: array of integers
output: integer
rules: 
- input/output could be positive, negative or 0
- do not include dup. numbers in summing
data structure: array, integers
problem: 
- sort numbers from smallest to largest
- remove duplicates
- take last 3 numbers and add them together
=end

def max_tri_sum(array)
  array.sort.uniq.last(3).sum
end

p max_tri_sum([3,2,6,8,2,3]) == 17
p max_tri_sum([2,9,13,10,5,2,9,5]) == 32
p max_tri_sum([2,1,8,0,6,4,8,6,2,4]) == 18
p max_tri_sum([-3,-27,-4,-2,-27,-2]) == -9
p max_tri_sum([-14,-12,-7,-42,-809,-14,-12]) == -33
p max_tri_sum([-13,-50,57,13,67,-13,57,108,67]) == 232
p max_tri_sum([-7,12,-7,29,-5,0,-7,0,0,29]) == 41
p max_tri_sum([-2,0,2]) == 0
p max_tri_sum([-2,-4,0,-9,2]) == 0
p max_tri_sum([-5,-1,-9,0,2]) == 1
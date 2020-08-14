# You are going to be given an array of integers. Your job is to
# take that array and find an index `N` where the sum of the
# integers to the left of `N` is equal to the sum of the integers
# to the right of `N`. If there is no index that would make this
# happen, return -1.

# For example:

# Let's say you are given the array [1,2,3,4,3,2,1]:
# Your method will return the index 3, because at the 3rd position
# of the array, the sum of left side of the index [1,2,3] and the
# sum of the right side of the index [3,2,1] both equal 6.

=begin

PROBLEM -
input: array of integers, positive or negative
output: integer, index of number whose left and right sides' sum is equal
question: what do i want to do with input?
- sum integers to right of current number
- sum integers to left of current number
- return index of integer if both sides equal

ALGORITHM -
- initialize 'left' to []
- initialize 'right' to []
- iterate using #each_with_index; block: current number, index
  - assign left to array[0...index]
  - assign right to array[index + 1..-1]
  - sum numbers of each array
  - compare arrays and return index if equal
  - return -1 if never equal
- end iteration
=end

def find_even_index(array)
  left = []
  right = []

  array.each_with_index do |number, index|
    left = array[0...index].sum
    right = array[index + 1..-1].sum
    return index if left == right
  end
  -1
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3

# first try: 40 minutes
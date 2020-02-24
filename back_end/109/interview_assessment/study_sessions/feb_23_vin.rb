# Let us consider this example (array written in general format):

# ls = [0, 1, 3, 6, 10]

# # Its following parts:

# ls = [0, 1, 3, 6, 10]
# ls = [1, 3, 6, 10]
# ls = [3, 6, 10]
# ls = [6, 10]
# ls = [10]
# ls = []

# [20, 20, 19, 16, 10, 0]


# The corresponding sums are (put together in a list): 
# The function parts_sums (or its variants in other languages) 
# will take as parameter a list ls and return a list of the sums 
# of its parts as defined above.

# Other Examples:
# ls = [1, 2, 3, 4, 5, 6] 
# parts_sums(ls) == [21, 20, 18, 15, 11, 6, 0]

# ls = [744125, 935, 407, 454, 430, 90, 144, 6710213, 889, 810, 2579358]
# parts_sums(ls) == [10037855, 9293730, 9292795, 9292388, 9291934, 9291504, 9291414, 9291270, 2581057, 2580168, 2579358, 0]

=begin

input: array
output: array of sums
rules; 
- total number of digits in array will be array size plus 1
data structure: array, integers
problem:
- find sum of array digits
- for next sum, delete first digit, add rest of numbers
- at the end of the array, add 0 to the list of digits
alogrithm: 
- create an empty array
- for array size times, calc. sum of digits, push to array
- remove first digit from array, repeat previous step
- when array is empty, push 0 to new array
- return array
=end

def parts_sum(array)
  sums = []

  array.size.times do 
    sums << array.sum
    array.shift
  end
  sums << 0
end

p parts_sum([0, 1, 3, 6, 10]) == [20, 20, 19, 16, 10, 0]
p parts_sum([1, 2, 3, 4, 5, 6]) == [21, 20, 18, 15, 11, 6, 0]
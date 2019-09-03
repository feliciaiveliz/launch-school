=begin

Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

input: an array
output: one array, with two nested arrays
rules: 
- first subarray contains first half of original array
- second subarray contains second half of original array
- if # of elements is odd, middle element will be in first array
examples: 
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
algorithm: 
- create halvies(array) method
- assign to variable 'middle' size of array.size /2 
- call ceil on result of array.size / 2
- initialize first_half variable and assign to array.slice(0, middle)
- initialize second_half variable and assign to array.slice(middle, array.size - middle)
- return [[first_half, second_half]]
- end method
=end

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) 
p halvsies([1, 5, 2, 4, 3])
p halvsies([5])
p halvsies([])
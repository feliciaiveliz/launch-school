# Write a method that combines two Arrays passed in as arguments,
# and returns a new Array that contains all elements from both Array
# arguments, with the elements taken in alternation.
#
# You may assume that both input Arrays are non-empty, and that they have
# the same number of elements.
#
# Example:
#

=begin

PROBLEM - 
input: two arrays
output: one array, elements of both arrays interwoven
question: what should be done with the input?
- take both elements from each array at same position
  - put them into new array
- continue for the length of first array
ALGORITHM: 
- initiailize 'interleave' to []
- iterate over first array using #each_with_index
  - push each element at each index from both arrays:
    - first array: element[index], second array: element[index]
- return array
=end

def interleave(a, b)
  interleave = []
  a.each_with_index do |_, index|
    interleave << a[index] << b[index]
  end
  interleave
end

# or

def interleave(a, b)
  a.zip(b).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

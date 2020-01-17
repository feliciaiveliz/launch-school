=begin

Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

input: an array
output: nested array
rules: 
- nested array will contain two arrays: 
  - the first will contain exactly the first half of the array
  - the second will contain the rest
  - if array size is odd, the first array contains larger half
data structure: array
pseudo-code:
- init. variable called 'middle' set it to array.size / 2.0 
  - account for odd numbers
- init. variable first and set to halving the array from the first 
  element to the middle
- init. variable second and set it to the middle (array size - middle)
- [first, second]
algorithm: 
- init. variable called 'middle' set it to array.size / 2.0 
  - account for odd numbers- ceil
- init. variable first and set to halving the array from the first 
  element to the middle
- init. variable second and set it to the middle (array size - middle)
- [first, second]
=end

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first = array[0, middle]
  second = array[middle, array.size - middle]
  [first, second]
end

# or 

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first, second = array[0...middle], array[middle...]
  [first, second]
end

def halvsies(array)
  middle = (array.size / 2.0).ceil
  [array[0...middle], array[middle...]]
end

def halvsies(array)
  half = (array.size / 2.0).ceil
  [array.take(half), array.drop(half)]
end

p halvsies([1, 2, 3, 4]) 
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
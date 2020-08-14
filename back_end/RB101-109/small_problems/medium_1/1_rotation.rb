=begin

Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.
Do not use the method Array#rotate or Array#rotate! for your implementation.

input: array
output: new array
rules: 
- original array should not be modified
- cannot use Array#rotate or #rotate!
- first element will be last element in array
examples: 
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]
x == [1, 2, 3, 4]             
data structure: array
algorithm: 
- define rotate_array method that passes an array as parameter
- create new empty array called rotate
- invoke #shift on array and append it to 'array' parameter
- add array + rotate
- return rotate
=end

def rotate_array(array)
  rotate = []
  rotate << array.shift
  array + rotate 
end

# LS

def rotate_array(array)
  array[1..-1] + [array[0]]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

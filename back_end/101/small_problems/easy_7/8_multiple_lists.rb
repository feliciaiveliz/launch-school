=begin

Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

input: two arrays
output: new array 
rules: 
- product must be from integers from both arrays with same index
- each array will have same number of elements
example: 
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
data structure: array
algorithm: 
- def multiply_list(a1, a2) method
- assign to first, second and third, the respective elements from each array
- assign to 'array' all three variables that represent each subarray
- call #map! on array to iterate over each subarray to multiply each item
- call #flatten to return a one-dimensional array
=end

def multiply_list(array1, array2)
  first = array1[0], array2[0]
  second = array1[1], array2[1]
  third = array1[2], array2[2]
  array = [first, second, third]

  array.map! do |sub_array|
    sub_array.inject(:*)
  end
  array.flatten
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# LS

def multiply_list(a1, a2)
  result = []

  a1.each_with_index do |number, index|
    result << number * a2[index]
  end

  result
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Further Explortion

def multiply_list(a1, a2)
  a1.zip(a2).map {|array| array.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11])

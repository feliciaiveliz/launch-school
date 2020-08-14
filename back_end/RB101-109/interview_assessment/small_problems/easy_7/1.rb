=begin

Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

input: two arrays
output: a new array
rules: 
- new array contains elements in both arrays
- elements are taken in alteration
- assume that both arrays are non-empty
data structure: array
pseudo-code: 
- interleave the two arrays
- flatten them 
- return the array
algorithm: 
- zip the first array to the second
- flatten them using #flatten!
=end

def interleave(a, b)
  a.zip(b).flatten
end

def interleave(a, b)
  array = []
  a.each_with_index do |element, index|
    array << element << b[index]
  end
  array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
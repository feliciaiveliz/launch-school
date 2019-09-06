=begin

Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.
You may assume that both input Arrays are non-empty, and that they have the same number of elements.

input: two arrays
output: new array
rules: 
- new array is combination of both arrays
- first element of new array is first element of first array
- second element of new array is first element of second array
- both arrays are same size, and are not empty
example: interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
data structure: array
algorithm: 
- define interleave(array1, array2) method
- array1 elements will be in even indexes
- array2 elements will be in odd indexes
- call inject on array1 to create new array and append elements
  - array1.inject([]) { |new_array, num| new_array << num }
- insert elements from array2 into odd indexed spaces in new array
- create counter that increments odd index index = 1
- array2.each { |letter| new_array.insert(index, letter) index += 2 }
- end method and return new_array
=end

# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.
# You may assume that both input Arrays are non-empty, and that they have the same number of elements.


def interleave(array1, array2)
  new_array = []
  
  array1.each do |num| 
    new_array << num
  end

  index = 1
  array2.each do |letter| 
    new_array.insert(index, letter) 
    index += 2
  end

  new_array
end

def interleave(array1, array2)
  result = []

  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

def interleave(array1, array2)
  array1.zip(array2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']


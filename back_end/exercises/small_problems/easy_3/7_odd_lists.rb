=begin

Write a method that returns an Array that contains every other element of an Array that is passed in as 
an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so 
on elements of the argument Array.

Input: 
- an array of values
Output: 
- an array of values
Rules/Requirements:
- array should contain values that are in every other space in the array
- starting at the 0th index- first value is returned, skip 1st index, return 2nd index
- add return values based on even-indexed values
- array can contain integers, strings, boolean values, etc.
- if array argument is empty, return empty array
- problem states that we are returning 'an' array, which implies that we are returning a 'new' one instead of original 
Examples: 
- oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
- oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
- oddities(['abc', 'def']) == ['abc']
- oddities([123]) == [123]
- oddities([]) == []
Data Structure: 
- arrays
- while loop
Algorithm: 
- define oddities method that takes one argument- array
- create empty array to push new values to- odd_elements
- start index at 0
- start while loop
- while index < size of array
- odd_elements << array[index]
- index += 2
- return odd_elements
- end method
=end 

# My Attempt after looking at solution and trying on my own from memory
def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index] # accessing element at that index starting at 0
    index += 2
  end
  odd_elements # returns new array of selected elements
end

p oddities([2, 3, 4, 5, 6])
p oddities([1, 2, 3, 4, 5, 6]) 
p oddities(['abc', 'def'])
p oddities([123]) 
p oddities([])

# Further Exploration
# 1st way:
def oddities(array)
  odd_elements = []
  array.each_with_index do |item, index| 
    odd_elements << item if index.even? 
  end
  odd_elements
end

p oddities([2, 3, 4, 5, 6])
p oddities([1, 2, 3, 4, 5, 6]) 
p oddities(['abc', 'def'])
p oddities([123]) 
p oddities([])

# Solve it that returns 2nd, 4th, 6th, etc. elements of the array

def oddities(array)
  odd_elements = []
  array.each_with_index do |item, index| 
    odd_elements << item if index.odd? 
  end
  odd_elements
end

p oddities([2, 3, 4, 5, 6])
p oddities([1, 2, 3, 4, 5, 6]) 
p oddities(['abc', 'def'])
p oddities([123]) 
p oddities([])
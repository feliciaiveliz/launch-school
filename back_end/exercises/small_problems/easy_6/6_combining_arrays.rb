=begin

Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

input: two arrays
output: an array
rules: 
- new array will contain all values from argument arrays
- remove all duplicates
examples: 
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
data structure: array
algorithm: 
- create merge(arr1, arr2) method
- add two arrays together arr1 + arr2
- call flatten to create one-dem array and uniq! on array to remove dups
- end method
=end

def merge(arr1, arr2) 
  array = arr1 + arr2
  array.uniq!
  array
end

def merge(arr1, arr2)
  [arr1 + arr2].flatten.uniq!
end

p merge([1, 3, 5], [3, 6, 9])


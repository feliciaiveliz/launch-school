=begin

Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

input: two arrays
output: an array
rules: 
- cannot contain dup. values
- if originals have dups. remove them
data structure: array
pseudo-code: 
- add the two arrays together and filter them
algorithm: 
- array 1 + array 2 
- invoke #uniq to remove dups.
- array 1 | array 2
- array1.union(array2) ?
=end

def merge(a, b)
  a | b
# end

def merge(a, b)
  (a + b).uniq
end

def merge(a, b)
  a.union(b)
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


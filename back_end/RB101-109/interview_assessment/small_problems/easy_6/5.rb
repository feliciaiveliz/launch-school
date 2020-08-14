=begin

input: array
output: a new array
rules: 
- do not modify original array
- reverse all elements of the array without #reverse(!)
data structure: array
pseudo-code: 
- create an empty array
- iterate over the array object
- pop off the first element of the original array
  - push it to the empty array
- return the new array
algorithm: 
- init. empty array called reversed_list = []
- iterate over array using #each
- unshift the first element from 'array' and add it to reversed_list
  - this will add the item to the array, and push it down to the right when others are pushed in
- return reversed_list
=end

def reverse(list)
  reversed_list = []
  list.each { |item|reversed_list.unshift(item)}
  reversed_list
end

def reverse(list)
  reversed_list = []
  list.reverse_each { |item| reversed_list << item }
  reversed_list
end

p reverse([1,2,3,4]) == [4,3,2,1]        # => true
p reverse(%w(a b e d c)) == %w(c d e b a) # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]       






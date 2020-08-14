=begin

Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

input: array
output: same array
rules: 
- original array must not be mutated
- cannot use reverse or reverse!
- reverse elements in place
- first element will be assigned to last element
- second element will be assigned to second to last element, etc.
- if there is only one element, that array will be returned as is
data structure: array
algorithm: 
- create list(array) method
- initialize index to 0
- enter a loop that will iterate over array
- if counter is equal to the size of the array, (4 == 4), break
- insert result of popping off last element of array in the 'index' index position
  - array.insert(index, array.pop) => array.insert(0, 4) 4 will now be in 0 index position
- increment index by 1 to move on to second element in array
- return original array
- end method
=end

# def reverse!(array)
#   index = 0
#   loop do 
#     break if index == array.size # counter cannot be greater than array size
#     array.insert(index, array.pop)
#     index += 1
#   end 
#   array
# end

def reverse!(array)
  left_index = 0
  right_index = -1

  loop do 
    break if left_index == array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end
  array
end


p list = [1, 2, 3, 4]
p result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

p list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

p list = []
p reverse!(list) == []
p list == []





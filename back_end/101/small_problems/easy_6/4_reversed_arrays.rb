=begin

Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

input: array
output: same array
rules: 
- original array must not be mutated
- cannot use reverse or reverse!
- reverse elements in place
- first element will be assigned to last element
data structure: array
algorithm: 
- create list(array) method
- assign counter to 0, this will be used to increment index in array
- assign first element to last
- assign next element to second to last element
- return array
- end method
=end 


def reverse!(list)
  index = 0
  last_index = -1

  loop do 
    list[0], list[-1] = list[-1], list[0]
    index += 1
    last_index -= 1
    break if index > list.size / 2
  end
  list
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

# def reverse!(arr)
#   counter = 0
#   loop do
#     break if counter == arr.size
#     arr.insert(counter, arr.pop)
#     counter += 1
#   end
#   arr
# end





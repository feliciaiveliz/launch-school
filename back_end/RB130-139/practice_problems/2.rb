# What does this return and why?

def exclaim(array)
  array.map {|item| yield(item)} 
end

value = '!!!'

p exclaim(["hi", "bye"]) { |n| n + value }

# This returns ['hi!!!', 'bye!!!'] because the return value of the 'exclaim' method is the #map call on 'array'.
# The return value of map is the final array containing the transformed elements based on the return value of the block
# yield(item) is the only line of code within the #map method, which yields to { |n| n + value } for each iteration, which for boths iterations returns 'hi!!!', and 'bye!!!', which will be contained in the final returned array.
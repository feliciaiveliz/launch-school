=begin

Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

input: nested array of strings and integers
output: array of strings
rules: 
- print string 'int' number of times
- 'apple', 3: "apple", "apple", "apple", etc.
data structure: array of strings
algorithm: 
- iterate over the nested array using #map 
  - this returns a new array
- pass each inner array to the block
  - use the last element of each array as the number of times to print the string
- array[-1].times 
  - print the string and add it to the new array
- return the new array
=end

# def buy_fruit(array)
#   grocery_list = []

#   array.each do |list|
#     fruit, quantity = list.first, list.last

#     quantity.times { grocery_list << fruit }
#   end
#   grocery_list
# end

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])

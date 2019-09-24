=begin

input: array of subarrays
output: array of strings
rules: 
- integer is number of times the string will account
- original array will be preserved
example: 
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
data structure: array
algorithm: 
- define buy_fruit method that takes one parameter 'array'
- initialize empty array called 'fruits'
- iterate over nested array using each
  - pass in each subarray to the block and assign it to item variable
- assign 'fruit' to first item in subarray, assign 'count' to second item
- invoke #times on 'count', and append each fruit to the 'fruits' array
- return 'fruits' array
=end

def buy_fruit(array)
  fruits = []

  array.each do |item|
    fruit, count = item[0], item[1]
    count.times { fruits << fruit }
  end

  fruits
end

# or 
def buy_fruit(list)
  list.map {|fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
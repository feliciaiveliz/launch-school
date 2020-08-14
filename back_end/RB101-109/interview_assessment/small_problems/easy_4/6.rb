=begin

Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

input: array of numbers
output: new array 
rules:
- new array will be same length of original array
- the first digit of first array will be the same for the second
- if array contains 1 element, return a new array with that element
- return empty array if the array is empty
- 1st element + 2nd element = 2nd element
- 2nd element + 3rd element = 3rd element
- etc.
data structure: array
pseudo-code: 
- create an empty array
- iterate over the array
- add the element + the second one and push it to the array
- continue doing this for the length of the array
- return array at end
algorithm: 
- initialize empty array called 'totals' = []
- iterate over array using #each

- return totals
=end

def running_total(array)
  totals = []
  sum = 0

  array.each do |value|
    totals << (sum += value)
  end

  totals
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

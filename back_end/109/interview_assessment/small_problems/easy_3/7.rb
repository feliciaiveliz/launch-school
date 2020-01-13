=begin

Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

input: array
output: array
rules: 
- return elements in odd indexes
- return new array
- if array empty, return empty array
data structure: array, integers
pseudo-code: 
- create an empty array
- iterate over array of integers
- if integer is at an odd index
  - push to array
- return an empty array if original array is empty
algorithm: 
- initialize empty array called odd_numbers
- iterate over array using #each_with_index to use 'index' block param.
- if index is even? push that number into 'odd_numbers'
- return 'odd_numbers'
=end

def oddities(array)
  odd_numbers = []

  array.each_with_index do |element, index|
    odd_numbers << element if index.even?
  end

  odd_numbers
end

# For odd-indexed elements

def oddities(array)
  odd_numbers = []

  array.each_with_index do |element, index|
    odd_numbers << element if index.odd?
  end

  odd_numbers
end

# another way

def oddities(array)
  array.select.with_index { |_, index| index.even? }
end


p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
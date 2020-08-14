=begin

Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

input: two arrays
output: one array with products
rules: 
- find product of each pair from elements of same index
- assume both arrays contain same number of elements
data structure: arrays
pseudo-code: 
- create an empty array
- iterate over one array with index
- take first element from first array and first from the second
- multiply them together and put them in the new array
- repeat these for the length of the array
- return the array
algorithm: 
- init. empty array called products = []
- iterate over first array using #size #times
- take first element from both arrays and multiply them using index
- a[0] * b[0]
- add them to products array using #<<
- return products array
=end

def multiply_list(a, b)
  products = []
  a.size.times do |index|
    products << a[index] * b[index]
  end
  products
end

p multiply_list([3, 5, 7], [9, 10, 11])

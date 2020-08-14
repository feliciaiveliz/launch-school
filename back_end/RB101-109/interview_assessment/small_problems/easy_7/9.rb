=begin

Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

input: two arrays
output: one array 
rules: 
- return product of every pair of numbers from each array
- sort array by increasing value
data structure: array, integer
pseudo-code: 
- create an empty array called products
- iterate over the first array
- multiply the first element by each element of the second array
- multiply the second element by each element of the second array
- return the new array, sort the values from lowest to highest
algorithm: 
- init. variable called products, set it to []
- init. variable 'count' set it to 0
- iterate over the first array using #each_with_index
- for each |num|, num * b[index]
=end

def multiply_all_pairs(a, b)
  products = []
  
  a.each do |item_1|
    b.each do |item_2|
      products << item_1 * item_2
    end
  end

  products.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2])

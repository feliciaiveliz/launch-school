=begin 

Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

input: two arrays
output: new array
rules: 
- new array will contain product of every pair of numbers that can be formed between the elements
- sort array by increasing value
- array will not be empty
examples: 
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
data structure: array 
algorithm: 
- define multiply_all_pairs(a1, a2) method
=end

def multiply_all_pairs(a, b)
  result = []

  a.each do |first|
    b.each do |second|
      results << first * second
    end
  end
  result.sort
end

def multiply_all_pairs(a, b)
  a.product(b).map { |array| array.inject(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]



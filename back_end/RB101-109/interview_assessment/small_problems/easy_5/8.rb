=begin

Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

input: array of integers
output: an array
rules:
- integers will be sorted based on english words
- 8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0
data structure: hash, array, integer
pseudo-code: 
- define alphabetic_number_sort method, passed in array 
- create an array that contains strings that are the english numbers
- iterate over 'array' and map the keys to their english word values
- sort the array based on the words
algorithm: 
- create array called WORDS = %w(zero one two, etc.)
- iterate over 'array' using sort_by to sort by the english word
  - WORDS[number]
- return the array
=end

WORDS = %w(zero one two three four five six seven eight nine ten
           eleven twelve thirteen fourteen fifteen sixteen seventeen
           eighteen nineteen)

def alphabetic_number_sort(array)
  array.sort_by { |number| WORDS[number] }
end

def alphabetic_number_sort(array)
  array.sort { |a, b| WORDS[a] <=> WORDS[b] }
end

p alphabetic_number_sort((0..19).to_a)


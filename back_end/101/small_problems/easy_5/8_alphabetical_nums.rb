=begin
Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:
zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

input: array of integers
output: array of integers
rules: 
- array should be sorted by english words
data structure: array
algorithm: 
- create alphabetic_number_sort(array) method
- create hash that maps each integer to its word 
- num_words = { 0: 'zero', 1: 'one', 2: 'two', 3: 'three', 4: 'four', 5: 'five', 6: 'six', 7: 'seven'
                8: 'eight', 9: 'nine', 10: 'ten', 11: 'eleven', 12: 'twelve', 13: 'thirteen', 
                14: 'fourteen', 15: 'fifteen', 16: 'sixteen', 17: 'seventeen', 18: 'eighteen', 19: 'nineteen' }
- sort the hash by value (String#,<=>) 
- call .keys to return array of the numbers with their sorted words
=end

# WORDS = {     0: 'zero', 1: 'one', 2: 'two', 3: 'three', 4: 'four', 5: 'five', 6: 'six', 7: 'seven'
#               8: 'eight', 9: 'nine', 10: 'ten', 11: 'eleven', 12: 'twelve', 13: 'thirteen', 
#               14: 'fourteen', 15: 'fifteen', 16: 'sixteen', 17: 'seventeen', 18: 'eighteen', 19: 'nineteen' }

# def alphabetic_number_sort(array)
#   words_hash = {}
  
#   WORDS.sort_by! {|num, word| word }
#   words_hash << array.each { |num, word| WORDS[num] = word}

#   words_hash.value
# end

# p alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]
  
# wrong.

WORDS = %w(zero one two three four
           five six seven eight nine
           ten eleven twelve thirteen fourteen
           fifteen sixteen seventeen eighteen nineteen)


def alphabetic_number_sort(array)
  array.sort_by {|number| WORDS[number] }
end

# Further Exploration

def alphabetic_number_sort(array, words)
  array.sort {|a, b| words[a] <=> words[b]}
end

p alphabetic_number_sort((0..19).to_a, WORDS) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
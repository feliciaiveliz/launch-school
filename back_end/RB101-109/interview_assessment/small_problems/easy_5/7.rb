=begin

Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

input: string
output: hash
rules: 
- hash keys are word sizes and values are occurrences of words of that size
- non-letter chars do not count
- it's is 3 not 4
data structure: array, hash, string
pseudo-code: 
- use method from previous exercise
- iterate over string, delete non-letter chars
- add new word to the array
- return array
  - sort it and convert it to a hash
algorithm: 
- initialize an empty array
- split str into array of words
- iterate over words with #each and delete each non-letter char
- delete('^a-z/i')
- add new word to array
- sort word and tally it to convert to hash 
=end

def word_sizes(string)
  array = []
  string.split.each do |word| 
    word.delete!('^A-Za-z')
    array << word.size
  end
  array.tally
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
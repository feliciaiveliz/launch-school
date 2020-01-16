=begin

Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

input: string
output: hash
rules: 
- words are string of chars that don't include spaces
- string can contain one or more spaces consecutively
- hash will contain keys that are integers
  - keys == string size
  - values == number of strings of that size
data structure: array, string, hash
pseudo-code: 
- split string into individual strings
- create an empty hash that will contain integers for keys and values
- tally number of words and their sizes
- 
=end


def word_sizes(string)
  string.split.map { |word| word.size }.tally
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?")
p word_sizes('') == {}


# or

def word_sizes(string)
  hash = Hash.new(0)
  string.split.each do |word|
    hash[word.size] += 1
  end
  hash
end


# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}
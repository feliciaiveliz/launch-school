=begin

Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

input: string
output: hash
rules: 
- words consists of string of characters that don't include space
- string may have one or more words
- hash shows number of words of different sizes
examples: 
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}
rules: 
- find size of smallest word
- key == word size
- value == number of words of that size
- characters/puncutation are included in word size
- empty string returns empty hash
data structure: string, array, hash
algorithm: 
- create word_sizes(string) method
- create empty hash called words_hash = {}
- split each string into array of words and save to variable words
  - words = string.split
- sort array to have shortest words first
  - use sort_by! sort array by size- word.sort_by! {|w| w.size}
- iterate over array to add key, value pairs to hash
- map key, values into hash, depending on word sizes
- words.each do |word|
  - words_hash[key] = value
  - words_hash[word.size] = words.count(word.size)
  - end
- return hash
- end method
=end

# First Attempt
def word_sizes(string)
  words_hash = {}
  words = string.split.sort_by! do |w|
    w.size
  end
  
  words.each do |word|
    words_hash[word.size] += 1
  end
  words_hash
end

# Refactored

def word_sizes(string)
  words_hash = Hash.new(0)  # hash will start with default value of 9 instead of nil
  string.split.each do |word|
    words_hash[word.size] += 1
  end
  words_hash
end


def word_sizes(string)
  words_hash = {}
  
  string.split.each do |word|
    size = word.size
    if words_hash.has_key?(size)
      worsds_hash[size] += 1
    else
      words_hash[size] = 1
    end
  end
  words_hash
end

p word_sizes('Four score and seven.') 
p word_sizes('Hey diddle diddle, the cat and the fiddle!') 
p word_sizes("What's up doc?")
p word_sizes('')

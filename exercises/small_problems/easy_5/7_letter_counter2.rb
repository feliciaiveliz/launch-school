=begin
Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

input: string
output: hash
rules:
- use previous method 'word_sizes'
- exclude non-letters when determining word size
- it's is 3, not 4
data structure: array, string, hash
algorithm: 
- use previous method
- create word_sizes method(string)
- create empty hash- words_hash = Hash.new(0)
- call split.each on string to iterate over words
  - string.split.each do |word|
- delete non-letters from string
- word.delete!(/[^a-z]/i)
- create key, value pairs into hash
- words_hash[word.size] += 1
- end method
- return hash
- end method
=end

def word_sizes(string)
  words_hash = Hash.new(0)

  string.split.each do |word|
    word.delete!('^a-zA-Z')  # 0r gsub!(/[^a-z]/i, "")
    words_hash[word.size] += 1
  end
  words_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
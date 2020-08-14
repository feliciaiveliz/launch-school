=begin
Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

input: string
output: a new string
rules: 
- capitalize every word in the string
- words are a sequence of non-blank chars
- lowercase all other letters
data structure: array, string
pseudo-code: 
- split string into an array of strings
- iterate over the words
- capitalize each word
- return new string
algorithm: 
- split string into individual words using #split
- iterate over them using #map
- for each word, capitalize! them
- return the new string
=end

def word_cap(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

def word_cap(string)
  string.split.map { |word| word[0].upcase + word[1..-1].downcase }.join(' ')
end

p word_cap('four score and seven')
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


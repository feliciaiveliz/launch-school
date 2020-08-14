# Write a method that takes a single String argument and returns
# a new string that contains the original value of the argument
# with the first character of every word capitalized and all other
# letters lowercase.
#
# You may assume that words are any sequence of non-blank characters.
#
# Examples:
#
# word_cap('four score and seven') == 'Four Score And Seven'
# word_cap('the javaScript language') == 'The Javascript Language'
# word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

=begin

input: string
output: a new string, each word capitalized
question: what should be done with the input?
- iterate over string and look at each word:
  - capitalize first letter, lowercase all other letters
- return new string
ALGORITHM -
- use #split to get array of words
- use #map to iterate:
  - use #capitalize on every word
- convert array to string using #join(' ')
- return string
=end

def word_cap(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
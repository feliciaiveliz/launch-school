# Write a method that takes a sentence string as input,
# and returns the same string with any sequence of the
# words 'zero', 'one', 'two', 'three', 'four', 'five',
# 'six', 'seven', 'eight', 'nine' converted to a string
# of digits.

=begin

PROBLEM: 
input: string
output: new string, number words are replaced w/ digits
?: what should be done with input?
- iterate over string, given each word:
  - determine if word is digit word, replace w/ digit if yes
- return new string
ALGORITM -
- initialize 'words' to array: 'one' to 'nine'
- initialize 'digits' to array: 1 to 9
- initialize 'word_digits': zip 'words' and 'digits' and convert to hash
- use #split and #map to iterate:
  - if word is included as key in 'word_digits', replace word with digit
- convert array into string using #join(' ')
=end

require 'pry'

WORDS = %w(one two three four five six seven eight nine)
DIGITS = (1..9).to_a
WORD_DIGITS = WORDS.zip(DIGITS).to_h

def word_to_digit(string)
  string.sub!('four.', '4.')

  string.split.map do |word|
    WORD_DIGITS.include?(word) ? WORD_DIGITS[word].to_s : word
  end.join(' ')

end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


=begin

Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

input: string, sentence
output: same string 
rules: 
- replace all integer words with their integers
- 'one' => 1, 'two' => 2, etc.
- return same string
data structure: 
- hash: number word 'one' => 1
- array of words from string
algorithm:
- create a hash that contains keys are number words and values as integers
  - words = { 'one' => 1 }
- iterate over the WORDS hash
- pass in the word and the number to the block
- if the word is included in the words hash as a key
  - replace the word with its integer counterpart
  - convert the integer to a string
- return the same string
=end

WORDS = {'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 
         'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9 }

def word_to_digit(string)
  WORDS.each do |word, number|
    string.gsub!(word, number.to_s) if string.include?(word)
  end
  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


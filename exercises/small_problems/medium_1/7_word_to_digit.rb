=begin

Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

input: string
output: same string
rules: 
- modify existing string
- string numbers will be converted to digits
- digits will only be seperated by spaces
example: 
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
data structure: string, array
algorithm: 
- define word_to_digit(string) method
- initialize hash that contains string numbers to their digits
  - digits = { 'zero' => 0, 'one' => 1, 'two' => 2 }
- map each string to its corresponding digit
=end

DIGITS = { 'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4,
  'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9}.freeze

def word_to_digit(string)
  DIGITS.keys.each do |word|
    string.gsub!(/\b#{word}\b/, DIGITS[word].to_s)
  end
  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')

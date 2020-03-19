# Given a string of words separated by spaces, write a method
# that takes this string of words and returns a string in which
# the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter,
# and that the string will always contain at least one word.
# You may also assume that each string contains nothing but words
# and spaces.

=begin

PROBLEM - 
input: string
output: new string, first/last letters swapped
?: what should be done with the input?
- iterate over string, look at each word:
  - swap first and last letters of word
  - move on to next word, repeat.
- return new string
ALGORITHM:
- split string using #split and #map to iterate:
  - use parellel assignment:
    - assign => word[0], word[-1] = word[-1], word[0]
    - return word in block
- convert array into string using #join(' ')
=end

def swap(string)
  string.split.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
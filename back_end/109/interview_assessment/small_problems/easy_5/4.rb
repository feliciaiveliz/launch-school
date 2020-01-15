=begin

Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

input: string of words
output: new string of words
rules: 
- first and last letters of word are swapped
- every word contains at least one letter
- the str will contain at least one word
- str will only contain words and spaces
data structure: string, array
pseudo-code: 
- define swap method that takes one parameter string
- create an empty str to push new words to
- split the string into an array of seperate words
- iterate over the words
- parellel assign the first char, with the last char of each word
- push these new words to the str variable
- return the string variable
algorithm: 
- split string into array of words and iterate using #map
- assign first char of word[0] to last char of word[-1]
- then assign last char of word[-1] to first char of word[0]
=end

def swap(string)
  str = []
  string.split.each do |word| 
    word[0], word[-1] = word[-1], word[0]
    str << word
  end
  str.join(' ')
end

p swap('Oh what a wonderful day it is') 
p swap('Abcde') 
p swap('a') == 'a'
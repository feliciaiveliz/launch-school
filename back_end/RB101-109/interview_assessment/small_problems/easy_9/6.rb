=begin

Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

input: string
output: array
rules: 
- array contains word value from string and its size
- seperate the word and the size, ex: word 3, word 4, etc.
data structure: array, string
pseudo-code: 
- split string into an array of string values
- iterate over the string
- the new values to populate the array are the string and string size
algorithm: 
- split string into an array of strings
- iterate over string using #map
- use string + ' ' string.size
=end

def word_lengths(string)
  string.split.map { |word| "#{word} #{word.size}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
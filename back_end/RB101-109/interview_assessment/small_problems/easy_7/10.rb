=begin

Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

input: string
output: single word
rules: 
- words are a sequence of non-blank chars
- the str will contain at least two words
data structure: array, string
pseudo-code: 
- split string into an array of words
- return the next to last element
algorithm: 
- split str using #split
- return array[-2] which is the next to last word
=end

def penultimate(string)
  return "" if string.empty?
  return string if string.size == 1

  
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
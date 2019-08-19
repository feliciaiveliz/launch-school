=begin

Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.
You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each stri

input: string
output: string
rules: 
- first and last letters are swapped
- if only a single letter, nothing is changed
- every string will contain at least one letter
- preserve case and spaces
algorithm: 
- create swap method(string)
- split string into array of words and save it to swap_string
- iterate over .each word
- word[0], word[-1] = word[-1], word[0]
- end method and return swap_string.join(' ')
=end

def swap(string)
  string.split.each do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  string.join(' ')
end

def swap(string)
  string.split.each { |word| word[0], word[-1] = word[-1], word[0] }.join(' ')
end

p swap('Oh what a wonderful day it is')
p swap('Abcde')
p swap('a')
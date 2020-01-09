=begin

Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

input: string
output: same string
rules: 
- if word contains 5 or more chars., reverse the word
- string will contain letters and spaces
data structure: array, string
pseudo-code: 
- convert string of words to an array 
- iterate over words
  - if word length is longer or equal to 5, reverse it
  - if word is less than 5, leave as is
- end
algorithm: 
- define reverse_words method and pass in string as paramter
- split string into an array of chars. using #split
- use #map to iterate over array
- if word.size is >= 5, reverse! the word
- if word.size is < 5, word
- end
=end

def reverse_words(string)
  string.split.map {|word| word.size >= 5 ? word.reverse! : word }.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
# Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present. 

=begin

Inputs: 
- a string that contains one or more words
  - will consist of only letters and spaces
  
Outputs: 
- returns string with all five or more letter words reversed
- if less than 5 letters, returns the word as is
- reverse words in place

Rules: 
- if word length is greater than 5, then reverse the word
- if word length is less than 5, return word

Requirements: 
- spaces will be included only when more than one word is present
- preserve letter case

Examples: 
- puts reverse_words('Professional') => 'lanoisseforP'
- puts reverse_words('Walk around the block') => 'Walk dnuora the kcolb'
- puts reverse_words('Launch School') => 'hcnuaL loohcS'

Data Structure:
- if/else statement
- array

Algorithm: 
- create method called reverse_words
- split string into array of words or word
  - save array of words into variable called words_array
  - 'launch school'.split => words_array = ['launch', 'school']
- create variable called words_size and assign it to the words_array array
  - call .length on words_array for integer length requirement
  - words_size = words_array.length
  - when words_size -= 1 is equal to zero, end loop (inside loop)
- create until loop that loops until words_array.length is zero? (true)
- inside loop we will check - 
  - call each method on words_array to iterate over words
  - use |word| parameter
  - if word.length is >= 5
    - word.reverse! - to permanently modify the string values
  - else if word.length is < 5, that is, 4
    - word
  - end 
  - words_size -= 1
- end each method
- return words_array.join(' ') to convert to string and preserve spaces
- end method
- puts reverse_words(words)
=end

def reverse_words(words)
  words_array = words.split
  # words_size = words_array.length
  # until words_size.zero?
    words_array.each do |word|
      if word.length >= 5
        word.reverse!
      else
        word
      end
    end
    words_array.join(' ')
end
    
puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')

# refactoring after a few weeks

def reverse_words(words)
  words.split.map {|w| w.size >= 5 ? w.reverse! : w }.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
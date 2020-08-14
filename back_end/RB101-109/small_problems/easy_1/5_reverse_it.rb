# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

=begin

Inputs: 
- a method that takes one argument
  - argument is a string
  - what if it's an integer, or space?

Outputs: 
- new string with words themselves in reverse order
- if string empty, return empty string
- preserve case

Rules: 
- only the words can be reversed, not the letters in the word itself
- original string cannot be modified

Examples/Test Cases: 
- puts reverse_sentence('') = ''
- puts reverse_sentence('Hello World') == 'World Hello'
- puts reverse_sentence('Reverse these words') == 'words these Reverse'
- puts reverse_sentence('Reverse this whole sentence') == 'sentence whole this Reverse'

Algorithm: 
- create reverse_sentence method 
  - takes one argument - words
- create empty array - new_sentence = []
- create a variable called words_array that will hold the result of splitting the words
- create a variable called words_size that will hold the words_array size
- until words_array length is zero (using length - integer)
  - add the return result of words_array.pop to new_sentence
  - decrement words_size to countdown from the original length of the words_array array
- return new_sentence - new_sentence.join(' ') to convert back to sentence with each word seperated by one comma and a space
- end until loop
- end reverse_sentence method

*Code*
=end

def reverse_sentence(words)
  words_array = words.split
  words_size = words_array.length
  reverse_words = []
    
  until words_size.zero?
    reverse_words << words_array.pop
    words_size -= 1
  end
  reverse_words.join(' ')
end
  
puts reverse_sentence('Hello  World')
  
# simpler version

def reverse_sentence(words)
  words.split.reverse.join(' ')
end
  
puts reverse_sentence("Reverse these words")
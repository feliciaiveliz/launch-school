=begin

Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

input: string
output: new string 
rules: 
- new string will contain words in reversed order
- if string is empty, return an empty string
- preserve word case
data structure: array, string
pseudo-code: 
- convert string into an array of seperate words
- reverse the array
- convert array back to string form
algorithm: 
- define reverse_sentence method, pass in one parameter string
- invoke #split method on string to convert to array
- invoke #reverse on the array to reverse the words in it
- invoke# #join on the array to convert back to string
- pass in ' ' empty space to join to properly format string
=end

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
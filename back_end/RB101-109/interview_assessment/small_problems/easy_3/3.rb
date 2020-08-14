=begin

Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

input: word or multiple words
output: integer
rules: 
- spaces should not count as a char.
- puncuation does count as chars
- words are seperated by a space
data structure: string, array
pseudo-code: 
- ask user for a word or multiple words
- convert string into an array
- count the number of chars in the string
- output number of chars in the string to user
algorithm: 
- ask user for words
- save into variable 'words'
- split string into array of chars using #chars and delete spaces
- count number of chars using #count
- puts out string to user that display the number of chars
=end

puts "Please write word or multiple words: "
words = gets.chomp
str_size = words.delete(' ').size
puts "There are #{str_size} characters in #{words}."

=begin
  
Write a program that will ask a user for an input of a word or multiple words and give back the 
number of characters. Spaces should not be counted as a character. 

Inputs: 
- string that asks user for word or words
- user inputs string

Outputs: 
- number length of characters of word(s)

Rules/Requirements
- spaces are not counted as a character
- punctuation is considered a character
- input can only be letters or characters, not numbers
- 'give back' should mean return, so return the integer number of characters

Examples: 
- Please type in a word or multiple words: walk
- (outout): There are 4 characters in 'walk'
- (input) Please type in a word or multiple words: walk, don't run
- (output): There are 13 characters in 'walk, don't run'

Test Cases:
- "walk, don't run".length == 15 with spaces
- "walk, don't run".lenght == 13 w/o spaces

Data Structure: 
- string

Algorithm: 
- ask user for words(s)- 'Please type in a word or multiple words'
- save word(s) to variable str
- 'There are #{str.split.join.size} characters in #{str}!'
=end


puts "Please type in a word or multiple words"
str = gets.chomp
puts "There are #{str.split.join.size} characters in #{str}!"
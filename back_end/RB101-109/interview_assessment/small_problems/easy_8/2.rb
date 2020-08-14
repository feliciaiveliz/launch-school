=begin

Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

input: strings
output: single string sentence
rules: 
- ask for noun, verb, adjective, adverb
- insert these words into a story sentence
data structure: string
pseudo-code: 
- ask user for noun, verb, adj., adverb
- save these strings into variables
- create a sentence that will hold these variables 
- output this string to the user that uses their words to tell a story
algorithm: 
- puts a statement to user that asks for 4 things
- init. variables and set it to what the user inputs
- use #puts to output the value of the string sentence
- use string interpolation to integrate user's choices into sentence
=end

puts "Enter a noun: "
noun = gets.chomp

puts "Enter a verb: "
verb = gets.chomp

puts "Enter an adjective: "
adjective = gets.chomp

puts "Enter an adverb: "
adverb = gets.chomp

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"



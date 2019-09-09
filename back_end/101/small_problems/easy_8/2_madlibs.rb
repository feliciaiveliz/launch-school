=begin

Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.
Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

input: string
output: string
rules: 
- madlibs is a game where you create a story template with blanks for words. 
  - ask player for words that represent noun, verb, adjective, and adverb
- replace the blanks with their placeholder words 
data structure: string 
algorithm: 
- loop do 
- puts "Let's play Madlibs! I will ask you for a noun, verb, an adjective, and an adverb. "
- ask user for noun: puts "Enter a noun: "
  - noun = gets.chomp.to_s
  - if noun =~ /[^a-zA-Z]/ then puts "Please enter only a noun. A noun is used to identify any of a class of people, places, or things." 
- ask user for verb: puts "Enter a verb: "
  - verb = gets.chomp
- ask user for verb: puts "Enter an adjective: "
  - adjective = gets.chomp
- ask user for adverb: puts "Enter an adverb: "
  - adverb = gets.chomp
- puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!
=end

  puts "Let's play Madlibs! I will ask you for a noun, verb, an adjective, and an adverb."
  
  puts "Enter a noun: "
  noun = gets.chomp

  puts "Enter a verb: "
  verb = gets.chomp

  puts "Enter an adjective: "
  adjective = gets.chomp

  puts "Enter an adverb: "
  adverb = gets.chomp

  puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"



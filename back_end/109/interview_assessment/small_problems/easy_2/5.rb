=begin

Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

input: 
- string, name of user
output: 
- string, greeting
rules: 
- if name does not include "!", give "Hello name" greeting
- if name does include "!", yell back at user
pseudo-code: 
- ask user for their name
- save name into variable called 'name'
- if the name includes "!"?, then output
  - "HELLO NAME. WHY ARE WE SCREAMING?"
=end

puts "What is your name?"
name = gets.chomp

name.include?("!") ? puts("HELLO #{name}. WHY ARE WE SCREAMING?") : puts("Hello #{name}")

# or

puts "What is your name?"
name = gets.chomp

if name.include?("!")
  puts "Hello #{name}"
else
  puts "HELLO #{name}. WHY ARE WE SCREAMING?"
end



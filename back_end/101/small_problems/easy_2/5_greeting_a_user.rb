=begin

Write a program that will ask for a user's name. The program will then greet the user. If the user writes 
"name!" then the computer yells back to the user.

Inputs:
- users name with or without '!'

Outputs: 
- statement greeting the user 

Examples: 
- What is your name? -> Felicia
  - Howdy Felicia!
- What is your name? -> Felicia!
  - HOWDY FELICIA! WHAT'S WITH ALL THE YELLING?!

Rules: 
- if the user enters only their name, then greet them back with 
  greeting word and their name, preserving case
- if user enters their name with '!', then capitalize every word in greeting

Algorithm: 
- create variable name
- ask user for their name and save it to name variable
- assign greeting variable
  - greeting = "Howdy #{name}!"
- assign variable for upcased greeting
  - yell_greeting = "HOWDY #{name}! WHAT'S WITH ALL THE YELLING?!"
- if name includes? '!' then upcase! the greeting
  if name.include?('!') 
    puts yell greeting
  else 
    greeting
  end
- end all
=end

puts "What is your name? "
name = gets.chomp

greeting = "Howdy #{name}!"
yell_greeting = "Howdy #{name} What's with all the yelling?!".upcase!

if name.include?('!')
  puts yell_greeting
else
  puts greeting
end


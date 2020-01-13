=begin

Build a program that displays when the user will retire and how many years she has to work till retirement.

input: integer- age
output: string 
rules: 
- display what year the user will retire
- display how many years are left for her to work
pseudo-code: 
- ask user what their age is
- save age into variable called 'age' and convert into integer
- ask user at what age they would like to retire
- save to variable called 'retire_age' and convert to integer
- initialize variable 'years_left' 
  - retire_age - age 
- initialize 'retire_year' variable 
  - add current year + years_left
- output year of retirement (retire_year)
- output years of work left (years_left)
=end

puts "What is your age?"
age = gets.chomp.to_i

puts "What age would you like to retire?"
retire_age = gets.chomp.to_i

current_year = Time.now.year
years_left = retire_age - age
retire_year = current_year + years_left

puts "It's #{current_year} You will retire in #{retire_year}."
puts "You have only #{years_left} years of work to go!"



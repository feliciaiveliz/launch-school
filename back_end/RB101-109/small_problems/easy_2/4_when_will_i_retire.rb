=begin
  
Build a program that displays when the user will retire and how many years she has to work until retirement.

Inputs: 
- user's current age as integer
- user's preferred retirement age

Outputs: 
- Current year as integer
- Year user will retire as integer
- statement that includes the number of years of work left

Rules: 
- accept only positive numbers for current age and retirement age

Examples: 
- What is your age? => 30
- At what age would you like to retire? => 70
-> The current year is 2019, so that means you'll retire in 2059!
-> You only have to work for 40 more years!

Algorithm: 
- ask user for current and retirement age and save both to variables
  - puts "How old are you?" 
    - user_age = gets.to_i
  - puts "At what age would you like to retire?"
    - retirement_age = gets.to_i
  - create variable for years_of_work
    - years_of_work = retirement_age - user_age
  - create variable for year_of_retirement
    - year_of_retirement = 2019 + years_of_work
  - statements for year of retirement and how many years left of work
    - puts "The year is 2019, which means you'll retire in #{year_of_retirement}!"
    - puts "You only have to work for #{years_of_work} more years!"
=end

puts "How old are you?"
user_age = gets.to_i

puts "At what age would you like to retire?"
retirement_age = gets.to_i

years_of_work = retirement_age - user_age
year_of_retirement = 2019 + years_of_work

puts "The year is 2019, which means you'll retire in #{year_of_retirement}!"
puts "You only have to work for #{years_of_work} more years!"
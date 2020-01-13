=begin

Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

input: integer- user number, string- for sum or product
output: string to give user their result
rules:
- integer must be greater than 0
- user must only enter 's' for sum and 'p' for product
questions: 
- valid user input for integers?
- validate user input for strings? 
data structure: array
pseudo-code: 
- ask user for an integer greater than 0
- retrieve answer, save to variable 'number'
- conver to integer
- ask user to enter either 's' or 'p'
- retrieve answer, save to variable 'operation'
- leave as string
- compute either the sum or product of numbers
- capture values from 1 up to the 'number'
- save result into variable called 'result'
- output results 
algorithm: 
- ask user for integer, initialize and save to variable 'number'
  - convert to integer using #to_i
- ask user for 's' or 'p', save to variable 'operation'
  - gets.chomp
- initialize variable 'result'
- use if/else statement to compute the result of operation
  - if 's', then +; if 'p' then :*
- use a range to capture values (1..number)
- use inject to either add or multiply values
- save result into variable 'result'
- use #puts to output string that tells user what the result is
=end

puts "Please enter an integer greater than 0: "
number = gets.chomp.to_i

puts "Enter 's' to compute the sum, or 'p' to compute the product: "
operation = gets.chomp

result = nil

if operation == 's'
  result = (1..number).inject(:+)
  puts "The sum of the integers between 1 and #{number} is #{result}."
else
  result = (1..number).inject(:*)
  puts "The product of the integers between 1 and #{number} is #{result}."
end





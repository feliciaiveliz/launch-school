=begin

Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

input: integers
output: mathemetical operations on the numbers
rules: 
- do not worry about input validation
pseudo-code: 
- ask user for the first and second numbers
- perform +, -, *, %, /, **
algorithm: 
- save operations into an array
- ask user for the first and second numbers
  - save them to 'first' and 'second' variables
- iterate over array of operations and perform each operation for numbers using inject
=end

operations = %w(+ - * / % **)

puts "Enter the first number: "
first = gets.chomp.to_i

puts "Enter the second number: "
second = gets.chomp.to_i

operations.each do |operation|
  result = [first, second].inject(operation)
  puts "#{first} #{operation} #{second} = #{result}"
end

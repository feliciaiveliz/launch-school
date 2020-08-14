=begin
  
Write a program that solicits 6 numbers from the user, then prints a message that describes whether
or not the 6th number appears amongst the first 5 numbers.

Inputs: 6 integers
Outputs: array of numbers
Rules: 
- The user must enter 6 numbers
- could be positive or negative
- numbers should be stored in an array to keep track
- the array will be searched for the 6th number and will print message on whether or not it is
Notes: 
- the array needs to be searched to find a copy of a number, so maybe uniq will work

Examples: 
==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].


==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].
Data Structure: 
- Array
- String 
Pseudo-Code:
- create empty array for all numbers by user
- save each number to array until it reaches the limit of 6
- iterate over array and search it to find if the last number is 
Algorithm: 
- create message method
- def prompt(msg) puts "#{msg}"
- create empty array named numbers = []
- prompt 'Enter the 1st number: 
- first_num = gets.chomp.to_i
- numbers << first_num
- repeat until 5th number
- 'Enter last number: 
- sixth_num = gets.chomp.to_i
- if numbers.include?(sixth_num)
- puts 'The number #{sixth_num} appears in #{numbers}!.
- else puts 'The number #{sixth_num} does not appear in #{numbers}.
=end 

def prompt(msg)
  puts "#{msg}"
end

numbers = []

prompt 'Enter the first number: '
first_num = gets.chomp.to_i
numbers << first_num

prompt 'Enter the second number: '
second_num = gets.chomp.to_i
numbers << second_num

prompt 'Enter the third number: '
third_num = gets.chomp.to_i
numbers << third_num

prompt 'Enter the fourth number: '
fourth_num = gets.chomp.to_i
numbers << fourth_num

prompt 'Enter the fifth number: '
fifth_num = gets.chomp.to_i
numbers << fifth_num

prompt 'Enter the last number: '
last = gets.chomp.to_i

if numbers.include?(last)
  puts "The number #{last} appears in #{numbers}!"
else
  puts "The number #{last} does not appear in #{numbers}."
end


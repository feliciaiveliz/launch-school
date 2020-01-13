=begin
Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

input: integers
output: string and array
rules: 
- numbers can be positive, negative or 0
- the 6th number is the 'last' number
- contain all numbers in an array
data structure: array
pseudo-code:
- ask user for first-fifth numbers
- create an empty array to contain values
- if the 6th number appears in array, say that it does
- if not, say that it does not appear in the array
algorithm: 
- initialize an empty array called 'numbers'
- ask user for first-fifth numbers and save them to variables
- convert each number to an integer
- ask user for sixth number, convert to integer and save to 'last'
- push these numbers into the array
- do not push the last number into the array
- use if/else statement to tell user whether or not the sixth number
  appears in the array
- use #include? to check the array 
=end

numbers = []

puts "Enter the first number: "
first = gets.chomp.to_i
numbers << first

puts "Enter the second number: "
second = gets.chomp.to_i
numbers << second

puts "Enter the third number: "
third = gets.chomp.to_i
numbers << third

puts "Enter the fourth number: "
fourth = gets.chomp.to_i
numbers << fourth

puts "Enter the fifth number: "
fifth = gets.chomp.to_i
numbers << fifth

puts "Enter the last number: "
last = gets.chomp.to_i

if numbers.include?(last)
  puts "The number #{last} appears in #{numbers}."
else
  puts "The number #{last} does not appear in #{numbers}."
end

# or 

numbers = []

puts "Enter the 1st number:"
numbers << gets.chomp.to_i
puts "Enter the 2nd number:"
numbers << gets.chomp.to_i
puts "Enter the 3rd number:"
numbers << gets.chomp.to_i
puts "Enter the 4th number:"
numbers << gets.chomp.to_i
puts "Enter the 5th number:"
numbers << gets.chomp.to_i
puts "Enter the last number:"
last_number = gets.chomp.to_i

if numbers.include? last_number
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}."
end

# You can push values directly into the array 
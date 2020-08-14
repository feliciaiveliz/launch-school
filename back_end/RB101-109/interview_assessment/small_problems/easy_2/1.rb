=begin

Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

input: integer
output: string
rules:
- age should be between 20 and 200
pseudo-code: 
- print out a string that starts with "Teddy is 'year' years old!"
- generate random number using string interpolation
algorithm: 
- puts a string 
- generate number using #rand and pass in argument as range
  - 20..200
=end

puts "Teddy is #{rand(20..200)} years old!"

# or

age = rand(2..200)
puts "Teddy is #{age} years old!"



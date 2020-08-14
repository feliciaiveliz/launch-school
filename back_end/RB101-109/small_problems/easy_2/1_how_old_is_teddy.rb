=begin
Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random 
number between 20 and 200. 

Input: 
- I'm not sure if there is input for this problem

Output: 
- age
- randomly generates a number between 20 and 200
- use string interpolation to output a string that includes the age

Example: 
- Teddy's age is 43 years old

Rules: 
- number can be only between 20 and 200

Data Structure: 
- rand method to generate number
- string interpolation 

Alogirthm: 
- use Random#rand method
- assign age variable to rand method
  - range is between 20..200
- end method
- output age as string
  - puts 'Teddy is #{age} years old.'
=end

age = rand(20..200)
puts "Teddy is #{age} years old!"








































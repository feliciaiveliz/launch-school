=begin

Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

input: integer
output: integer
rules: 
- if number postive, return -number
- if number 0 or negative, return number
data structure: integer
pseudo-code: 
algorithm: 
- if number is positive, return -number
- else return number
=end

def negative(number)
  number.positive? ? -number : number
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0   
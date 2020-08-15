=begin

Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

input: integer
output: integer
rules: 
- if number is postive, return negative
- if number is negative, return number
- if 0, return 0
examples: 
negative(5) == -5
negative(-3) == -3
negative(0) == 0   
algorithm: 
- define negative method that passes in number as parameter
- number.postive? ? number * -1 : number
=end 

def negative(number)
  number.positive? ? number * -1 : number
end

# or 

def negative(number)
  number.positive? ? -number : number
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0   

=begin

Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

inputs: positive integer, boolean
output: integer
rules: 
- if true, bonus is half of salary
- if false, bonus is 0
pseudo-code: 
- if boolean is equal to true, then divide bonus by 2
- if boolean is equal to false, then return 0
algorithm: 
- if bonus is true? then bonus / 2
- otherwise 0
=end

def calculate_bonus(salary, bonus)
  bonus ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
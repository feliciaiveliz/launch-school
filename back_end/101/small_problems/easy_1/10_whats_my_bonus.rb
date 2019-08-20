# Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

=begin

Inputs: 
- a positive integer
- a boolean

Outputs: 
- calculates bonus depending on boolean value
- if true, bonus amount is half of salary
- if false, bonus is 0

Examples: 
- puts calculate_bonus(2800, true) == 1400
- puts calculate_bonus(1000, false) == 0
- puts calculate_bonus(50000, true) == 25000

Data Structure: 
- if/else statement

Algorithm 1: 
- create method called calculate_bonus()
  - two arguments: (salary, boolean)
  - bonus = ''
- if boolean == true
  - bonus = salary / 2
  - return bonus
- else false
  - bonus = 0
  - return 0
- end method

Algorithm 2: 
- create method called calculate_bonus
- use ternary operator
- bonus ? salary / 2 : 0
- end method
=end

def calculate_bonus(salary, boolean)
  bonus = ''
  if boolean == true
    bonus = salary / 2
  else
    bonus = 0
  end
bonus
end
  
def calculate_bonus(salary, bonus)
  bonus ? (salary / 2) : 0
end
  
puts calculate_bonus(2800, true) 
puts calculate_bonus(1000, false) 
puts calculate_bonus(50000, true) 
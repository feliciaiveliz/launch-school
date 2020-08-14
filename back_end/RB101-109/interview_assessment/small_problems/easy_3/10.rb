=begin

Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

input: integer
output: boolean
rules: 
- the number must read the same forwards and backwards
- if single digit, return true
algorithm: 
- convert the number to a string
- reverse it and check if it's the same backwards
=end

def palindromic_number?(number)
  number.to_s.reverse == number.to_s
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

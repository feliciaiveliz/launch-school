=begin

Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic 
number reads the same forwards and backwards.

Input: integer
Output: either boolean values
Rules: 
- returns true if integer is palindrome
- false otherwise
- palindrome is number that reads the same forwards and backwards
Examples: 
- palindromic_number?(34543) == true
- palindromic_number?(123210) == false
- palindromic_number?(22) == true
- palindromic_number?(5) == true
Data Structure: 
- integer
Algorithm: 
- def palindromic_num? method that takes an argument (integer)
- integer.to_s == integer
- end method
=end

def palindrome?(integer)
  integer == integer.reverse
end

def palindromic_number?(integer)
  palindrome?(integer.to_s)
end

p palindromic_number?(34543) 
p palindromic_number?(123210) 
p palindromic_number?(22) 
p palindromic_number?(5) 
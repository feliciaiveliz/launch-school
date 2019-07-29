=begin

Write a method that returns true if the string passed as an argument is a palindrome, false otherwise.
A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation
and spaces.

Input:
- a string of one or multiple words, or numbers
Outputs; 
- return result boolean values
Rules/Requirements: 
- return true if string is palindrome
- a palindrome reads the same forward or backward
- case matters, as well as punctuation and spaces
  - clarification: 'M' != 'm'
Examples: 
- palindrome?('madam') == true
- palindrome?('Madam') == false          # (case matters)
- palindrome?("madam i'm adam") == false # (all characters matter)
- palindrome?('356653') == true
Data Structure: 
- string
Algorithm: 
- def method palindrome that takes one argument (string)
- true if string.reverse == string
- end method
=end

def palindrome?(string)
  return true if string.reverse == string
  false
end

def palindrome?(string)
  string.reverse == string # this will return boolean values; return is not needed
end

p palindrome?('madam') 
p palindrome?('Madam') 
p palindrome?("madam i'm adam") 
p palindrome?('356653') 

def palindrome?(data_type)
  data_type.reverse == data_type
end

p palindrome?('madam') 
p palindrome?('Madam') 
p palindrome?("madam i'm adam") 
p palindrome?('356653') 
p palindrome?([1, 2, 3, 2, 1])
=begin

Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

input: string
output: boolean
rules: 
- a palindrome reads the same forwards and backwards
- case matters; 'm' != 'M'
- string can include digits
- puncutation matters in that it does not count 
data structure: string
pseudo-code: 
- compare the strings
- if they are not equal when reversed, then it is not a palindrome
algorithm: 
- compare the strings using ==
- reverse one of the strings to see if the other equals the first
=end

def palindrome?(string)
  string.reverse == string
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?([1, 2, 3, 2, 1]) == true
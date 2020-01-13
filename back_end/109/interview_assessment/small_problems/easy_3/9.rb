=begin

Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

input: string
output: boolean
rules: 
- this method should be case insensitive
- only numbers and letters matter
- digits can be included in the string
data structure: string
pseudo-code: 
- compare the first string against the second
- if the string has a differnt case then the one its being compared to,
  change its case to match
algorithm: 
=end

def palindrome?(string)
  string.reverse == string
end

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
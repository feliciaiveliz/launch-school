# ask in study group

=begin

Write another method that returns true if the string passed as an argument is a palindrome, false 
otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-
alphanumeric characters. If you wish, you may simplify things by calling the palindrome? method you 
wrote in the previous exercise.

Input: string
Output: returns of boolean values
Rules: 
- returns true if string is palindrome
- returns false if not
- case does not matter
- puncuation should be ignored
Examples: 
- real_palindrome?('madam') == true
- real_palindrome?('Madam') == true           # (case does not matter)
- real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
- real_palindrome?('356653') == true
- real_palindrome?('356a653') == true
- real_palindrome?('123ab321') == false
Data Structure: 
- strings
Algorithm: 
- define real_palindrome? method 
- string = string.downcase.delete('^a-z0-9')
- call palindrome method and pass in string
- end method
=end

def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

p real_palindrome?('madam')
p real_palindrome?('Madam')  
p real_palindrome?("Madam, I'm Adam")
p real_palindrome?('356653')
p real_palindrome?('356a653')
p real_palindrome?('123ab321')
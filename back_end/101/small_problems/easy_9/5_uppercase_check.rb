=begin

Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

input: string
output: boolean
rules: 
- all chars must be either uppercase to be true
- non-alpha chars are not included
- empty string will return true
examples: 
uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true
algorithm:
- define uppercase method with string as parameter
- compare string == string.upcase
- if string is not already uppercased, it will return false
=end


def uppercase?(string)
  return false if string.empty? 
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

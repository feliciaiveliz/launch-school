=begin

Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

input: string
output: boolean
rules: 
- if all chars inside string are uppercase, true
- else false
data structure: string
pseudo-code: 
algorithm: 
- if the string is equal to the string when upcased, it's true
=end

def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# It would not make sense to return false. Everything in Ruby evaluates to true or is truthy
# except false or nil. An empty string is neither, therefore it should return true.
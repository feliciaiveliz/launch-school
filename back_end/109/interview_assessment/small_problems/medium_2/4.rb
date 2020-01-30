=begin

Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

input: string
output: boolean
rules: 
- balanced: ( ) 
- unbalanced: ), (, ) (, 
- no parentheses present is balanced
data structure: string, array
algorithm: 
- split string into an array of chars
- iterate over array of chars
- create a variable called count
- if char matches ) first, return false
- otherwise: 
  - if char matches a (, add 1 to count
  - if char matches a ), subtract 1 from count 
=end

def balanced?(string)
  count = 0
  string.each_char do |char|
    count += 1 if char == "("
    count -= 1 if char == ")"
    return false if count < 0
  end
  count.zero? 
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

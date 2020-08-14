# Write a function called `valid_parentheses` that takes a
# string of parentheses, and determines if the order of
# the parentheses is valid. The function should return true
# if the string is valid, and false if it's invalid.

=begin

PROBLEM - 
input: string of parentheses
output: boolean
question: what should be done with input?
- keep track of open/close parenthese pairs
- not a pair if: 
  - str starts with ")"
  - str contains only one parentheses

ALGORITM -
- initialize 'open' to 0
- initialize 'close' to 0
- iterate using #each_char:
  - increment 'open' by 1 if "("
  - increment 'close' by 1 if ")"
  - return false if str starts with ")"
- after iteration:
  - return true if open == close, false otherwise

- initialize 'match' to 0
- iterate using #each_char:
  - if paren == "(" increment 'match' by 1
  - if paren == ")" decrement 'match' by 1
- if match ever equals -1 return false
=end

def valid_parentheses(string)
  match = 0

  string.each_char do |paren|
    paren == "(" ? match += 1 : match -= 1
    break if match < 0
  end
  match.zero?
end

p valid_parentheses( "()" ) == true
p valid_parentheses( "())" ) == false
p valid_parentheses( ")(()))" ) == false
p valid_parentheses( "(" ) == false
p valid_parentheses( "(())((()())())" ) == true
p valid_parentheses( "(()))(" ) == false
p valid_parentheses( "(((((()))))))((())" ) == false
p valid_parentheses( "((())())" ) == true
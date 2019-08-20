=begin

The || operator returns a truthy value if either or both of its operands are truthy, a falsey value if both 
operands are falsey. The && operator returns a truthy value if both of its operands are truthy, and a 
falsey value if either operand is falsey. This works great until you need only one of two conditions to be 
truthy, the so-called exclusive or.

In this exercise, you will write a method named xor that takes two arguments, and returns true if 
exactly one of its arguments is truthy, false otherwise.

Input: 
- two intgers
Output: 
- return value of either true or false
Rules:
- returns true if one of arguments is truthy
- returns false if both arguments are truthy
- returns false if both arguments are false
Examples: 
- xor?(5.even?, 4.even?) == true
- xor?(5.odd?, 4.odd?) == true
- xor?(5.odd?, 4.even?) == false
- xor?(5.even?, 4.odd?) == false
- xor?(-6.even?, 4.odd?) == true
Data Structure: 
- comparison opeartors
- if/else statement
Algorithm: 
- define xor? method that takes two arguments (n1, n2)
- if n1 == true && n2 == false
  return true
- elsif n1 == true && n2 == true
  return false
- else 
  return false
-end 
=end

# First try, will come back later at study session
def xor?(n1, n2)
  if n1 == true && n2 == false
    return true
  elsif n1 == false && n2 == true
    return true
  elsif n1 == true && n2 == true
    return false
  else 
    return false
  end
end

p xor?(5.even?, 4.even?) 
p xor?(5.odd?, 4.odd?) 
p xor?(5.odd?, 4.even?)
p xor?(5.even?, 4.odd?)
p xor?(-6.even?, 4.odd?)
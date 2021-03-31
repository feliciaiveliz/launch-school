=begin
  
Using the multiply method from the "Multiplying Two Numbers" problem, write a method that
computes the square of its argument (the square is the result of multiplying a number by itself).

Input: one integer
Output: return result of square operation
Rules: number can be either positive or negative
Clarifying Questions: 
- What is square? The result of multiplying a number by itself.
- What if we have a string, or array, or any other type besides integer?
Examples: 
- square(5) == 25  # true
- square(-8) == 64 # true
Algorithm:
- define square method that takes one argument
- n1 * n1
=end

def multiply(n1, n2)
  n1 * n2
end

def square(num)
  multiply(num, num)
end

p square(5)      # 25
p square(-8)     # 64
# p square([4])    # no immplicit conversion of Array into Integer
# p square('meow') # no implicit conversion of String into Integer
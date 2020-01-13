=begin

Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

input: integer
output: integer- the number squared
rules: 
- should only return an integer
algorithm: 
- define method square that takes one argument
- mult. this number by itself by using the multply method from before
=end

def multiply(a, b)
  a * b
end

def square(a)
  multiply(a, a)
end

p square(5)
p square(-8)
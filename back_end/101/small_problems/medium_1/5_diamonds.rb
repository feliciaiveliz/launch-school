=begin

Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

input: odd integer
output: 4 pointed diamond in n x n grid
rules: 
- argument will always be odd integer
- each row will contain an odd number of stars
- count up from 1 upto (n)
- count downwards from line with (n) stars back to 1
algorithm: 
- define diamond method
- count from 1 upto (number) passing in a block
  - pass in 'n', puts "*" * n, invoke 'center' to pad the string with (number) spaces
  - only output odd numbers using #odd?
- count downwards from (number - 1) to 1 and pass in block
  - puts "*" * n, invoke #center(number) to pad strings with (number) if it is odd?
  - this will print out strings counting from 8 - 1, so 7, 5, 3, 1
- end method
=end

def diamond(number)
  1.upto(number) {|n| puts ("*" * n).center(number) if n.odd? }
  (number - 1).downto(1) {|n| puts ("*" * n).center(number) if n.odd? }
end

p diamond(9)


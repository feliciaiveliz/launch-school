=begin

Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

input: odd integer
output: odd number stars up to argument
rules: 
- first line: 1 star
- middle line: 'n' stars
- last line: 1 star
- odd- numbered stars from 1 to 'n'
data structure: integer
algorithm: 
- for 'n' = 9
- print 4 spaces, 1 star
- print 3 spaces, 3 stars
- print 2 spaces, 5 stars
- print 1 space, 7 stars
- print 0 spaces, 9 stars
- from 1 up to 'n'
  - spaces: (" " * n - odd_number)
  - stars: ("*" * odd_number)
- if the number is odd: 
  - use #center to pad the stars with spaces
  - ("*" * odd_number).center(n)
- if number is even, skip the iteration
=end

def diamond(n)
  1.upto(n) do |number|
    number.even? ? next : puts(("*" * number).center(n))
  end
  (n - 1).downto(1) do |number|
    number.even? ? next : puts(("*" * number).center(n))
  end
end

p diamond(1)
p diamond(3)
p diamond(9)
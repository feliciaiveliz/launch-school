=begin

Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

input: integer
output: right triangle of stars
rules: 
- all sides have 'n' stars
- one end of hypotenuse will be at lower-left
- the other will be at upper right
- from 1 up to 'n'
  - 
data structure: 
pseudo-code: 
- for 5 stars
  - print 4 spaces, 1 star
  - print 3 spaces, 2 stars
  - print 2 spaces, 3 stars
  - print 1 space, 4 stars
  - print 0 spaces, 5 stars
- from 1 up to 'n' |i|
- print (n - i) spaces, + i stars
- print (n - 2) spaces, + i stars, et
algorithm: 
- define triangle method, pass in 'n' parameter
- from 1 upto 'n' do: pass in i to represent current number
- print each line of stars and spaces
  - puts "#{((n - i) * " ") + (i * '*')}"
=end

def triangle(n)
  1.upto(n) {|i| puts " " * (n - i) + ("*" * i)}
end

# further exploration

def triangle(n)
  n.downto(1) {|i| puts " " * (n - i) + ("*" * i)}
end

p triangle(5)
p triangle(9)

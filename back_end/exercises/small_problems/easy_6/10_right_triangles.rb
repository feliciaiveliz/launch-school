=begin

Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

input: positive integer
output: right triangle of stars
rules: 
- right triangle- hypotenuse is diagonal side with one end in lower-left and other end in upper-right
algorithm: 
- define triangle(num) method
- num.times {|n| puts (num * " ") + "*" }
- call .rjust(num) to pad the string with the number of spaces equal to num
- end method
=end

def triangle(num)
  num.times {|n| puts (("*" * n) + "*").rjust(num) }
end

# Further Exploration

def triangle(num)
  num.downto(0) {|n| puts (("*" * n)).rjust(num) }
end


p triangle(5)
p triangle(9)


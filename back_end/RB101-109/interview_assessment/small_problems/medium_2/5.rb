=begin

A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

input: 3 integers, size lengths of triangle
output: symbol, triangle name
rules: 
- equilateral: 3 sides equal length
- isosceles: 2 sides equal length, 1 different
- scalene: 3 sides different lengths
- valid triangle: 
  - length of sizes > 0
  - sum of two shortest sides > length of longest side
data structure: integer, array
algorithm: 
- place integers into an array
  - call digits on the first integer then push the rest of them in the array
- sort the integers
  - smallest => longest
- iterate through the array
    - if any? number is 0, return :invalid
    - if (first digit + second digit) > third digit
        - if first == second, second == third are equal, return :equilateral
        - if second == third are equal and second != first, :isosceles
        - if first != second, second != third, return :scalene
        - return :invalid
=end

def triangle(a, b, c)
  sides = [a, b, c]
  sides = sides.sort!

  return :invalid if (sides.any?(0)) || ((sides[0] + sides[1]) < sides[2])
  return :isosceles if (sides[1] == sides[2]) && (sides[1] != sides[0])
  return :equilateral if sides.all?(a)
  :scalene
end

p triangle(3, 3, 3)  == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3)  == :invalid
p triangle(3, 1, 1) == :invalid
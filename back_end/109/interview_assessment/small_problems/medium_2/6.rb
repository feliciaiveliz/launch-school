=begin

A triangle is classified as follows:

right One angle of the triangle is a right angle (90 degrees)
acute All 3 angles of the triangle are less than 90 degrees
obtuse One angle is greater than 90 degrees.
To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.
Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.
You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

input: 3 integers, degree angles
output: symbols, triangle name
rules: 
- right: 1 angle is 90 degrees
- acute: 3 angles are < 90 degrees
- abtuse: 1 angle > 90 angle
- valid triangle: 
  - sum of angles == 180 degrees
  - all angles > 0
- inputs are valid whole integers, degrees
data structure: integers, array
algorithm: 
- put angles into an array
- if 1 angle is == 90 degrees, return :right
- if all angles are < 90 degrees, return :acute
- if any angle is > 90 degrees, return :obtuse
- if any angle <= 0, return :invalid
=end

def triangle(a, b, c)
  angles = [a, b, c]

  return :invalid if angles.any?(0) || angles.sum != 180
  return :obtuse if angles.any? {|angle| angle > 90 }
  return :acute if angles.all? {|angle| angle < 90 }
  return :right 
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

=begin

Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

input: three integers
output: string
rules: 
- calculate average of three numbers
- add all three numbers, then divide by 3 
examples: 
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"
data structure: case statement
algorithm: 
- define get_grade method with x, y, z parameters
- average = (x + y + z) / 3
- case average 
when >= 90 && <= 100 then "A"
=end

def get_grade(x, y, z)
  average = (x + y + z) / 3

  if average >= 90 && average <= 100 then "A"
  elsif average >= 80 && average < 90 then "B"
  elsif average >= 70 && average < 80 then "C"
  elsif average >= 60 && average < 70 then "D"
  else "F"
  end
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"

# or 

def get_grade(x, y, z)
  average = (x + y + z) / 3

  case average
  when 90..100 then "A"
  when 80..89 then "B"
  when 70..79 then "C"
  when 60..69 then "D"
  else "F"
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
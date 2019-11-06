# First Study Session w/ Srdan on November 1, 2019
# Students: Yu Xia, Felicia Bacon

# Questions

def test(str)
  str += '?'
  str.downcase
end

test_str = "Written Assessment"
test(test_str)

puts test_str # Written Assessment

# Why? Line 7 is reassignment, not a mutating action. The original string is unmodified.

animal = "dog"

loop do 
  animal = "cat"
  toy = "ball"
  break
end

puts animal # cat
puts toy # undefined local variable or method `toy` for main:Object

# Why? 'animal' variable is initialized in outer scope therefore it is accessible within do...end block inner scope. 'toy' variable
# is initialized within do...end block therefore the outer scope cannot access it. 



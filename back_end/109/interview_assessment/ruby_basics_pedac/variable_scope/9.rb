# What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a # 7

# This is variable shadowing; a local variable in the outer scope and one in the inner scope share the same name; this means that the outer scope variable will be ignored. 
# The value of 'a' will stay the same.



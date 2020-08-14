# What does x print to the screen? Do they both give errors? Are the errors different? Why?

x = 0 
3.times do
  x += 1
end 
puts x
# x prints out 3 to the screen because it iterates through the block 3 times. X is initialized in the outer scope therefore it is available to the method. 


y = 0
3.times do 
  y += 1
  x = y
end
puts x
# x prints out an error because x was not initialized in the outer scope.


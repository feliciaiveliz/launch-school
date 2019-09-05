# The program eval. the line x >= 0. This evals to true and the program enters the loop, executing puts x and x = x - 1.It returns to the top with the updated value of x and evals x >= 0.
# This process repeats until 


x = gets.chomp.to_i

while x >= 0
  puts x
  x -= 1
end

puts "Done!"


# original

x= gets.chomp.to_i
while x >= 0
  puts x 
  x -= 1
end ''
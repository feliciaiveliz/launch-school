# Modify the following loop so it iterates 5 times instead of just once.

iterations = 1

loop do 
  puts "Number of iterations = #{iterations}"
  break if iterations == 5 # this will exit the loop if iterations is equal to 5
  iterations += 1 # this increments counter by 1
end

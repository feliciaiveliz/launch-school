# Modify the following loop so it iterates 5 times instead of just once.

iterations = 1

loop do 
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

# We must increment the 'iterations' by 1 otherwise it won't go past 1.
# The break condition prevents an infinite loop.
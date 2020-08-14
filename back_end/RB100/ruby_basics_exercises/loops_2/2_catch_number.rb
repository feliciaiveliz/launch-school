# Modify the following code so that the loop stops if number is equal to or between 0 and 10.

loop do 
  number = rand(100) # assigning random integer to number upon each integer
  puts number
  break if number.between?(0, 10)
end


# Using next, modify the code below so that it only prints even numbers.

number = 0

until number == 10
  number += 1       # number has to increment first, and the check will have to come after that before it can be output. 
  next if number.odd?
  puts number
end

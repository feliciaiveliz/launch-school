# Using next, modify the code below so that it only prints even numbers.

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

# Further Exploration

# It needs to be placed before 'puts' because any code after it, (it it evals to true) will not execute.
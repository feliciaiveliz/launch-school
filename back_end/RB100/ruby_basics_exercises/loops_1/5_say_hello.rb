# Modify the code below so "Hello!" is printed 5 times.

say_hello = true
counter = 1

while say_hello # the loop will execute at least once
  puts "Hello!"
  say_hello = false if counter == 5 # this will ensure the loop executes exactly 5 times
  counter += 1 # this will increment up to 5
end


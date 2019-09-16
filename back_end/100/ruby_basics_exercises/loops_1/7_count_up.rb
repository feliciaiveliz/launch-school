# The following code outputs a countdown from 10 to 1. Modify the code so that it counts from 1 to 10 instead.

count = 1

until count > 10 # greater than is used to include 10, otherwise if == is used, it will only go up to 9
  puts count
  count += 1
end


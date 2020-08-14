# Modify the following code so that the loop stops if number is equal to or between 0 and 10.

loop do 
  number = rand(100)
  puts number
  break if number.between?(0, 10)
end


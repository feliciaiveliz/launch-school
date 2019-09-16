# Given the array of several numbers below, use an until loop to print each number.

numbers = [7, 9, 13, 25, 18]

until numbers.empty?
  puts numbers.shift # this removes the first element from the array and returns it, while being printed
end

# or 

until numbers.empty?
  puts numbers
  break # this will break out of the loop when all numbers have been printed, otherwise it will print infinitely
end




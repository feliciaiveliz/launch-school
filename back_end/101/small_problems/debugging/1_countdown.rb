=begin 

Our countdown to launch isn't behaving as expected. Why? Change the code so that our program successfully counts down from 10 to 1.

First Attempt: 

def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

puts 'LAUNCH!'

Output: 
10
10
10
10
10
10
10
10
10
10
LAUNCH!
=end

# LS Solution
def decrease(counter)
  counter - 1  # reassignment in previous solution wasn't necessary. 'counter' here in this method is local only to this method and is not the same as the 'counter = 10' beneath it
end

counter = 10

10.times do 
  puts counter
  counter = decrease(counter) # reassignment takes place here
end

puts "Launch!"

# My solution

10.downto(1) do |counter|
  puts counter
end

puts 'LAUNCH!'
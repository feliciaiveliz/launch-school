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

10.downto(1) do |counter|
  puts counter
end

puts 'LAUNCH!'
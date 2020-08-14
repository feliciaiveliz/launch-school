=begin


algorithm: 
- use a range to capture numbers 1-99
- use two dots to make sure 99 is included
- use #each to iterate over this range, passing each number to the block
- if i is an even number, print it
- if i is an odd number, don't print it
=end

(1..99).each { |i| puts i if i.even? }

# # or

value = 1
while value <= 99
  puts value
  value += 2
end

# or

puts (1..99).select { |i| i.even? }

# or 

puts (1..99).select(&:even?)
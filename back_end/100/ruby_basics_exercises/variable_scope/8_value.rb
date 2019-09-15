# What will this print and why?

array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

# This allows us to output 3.
array = [1, 2, 3]
a = nil

array.each do |element|
  a = element
end

puts a

# error message. 'a' is initialize within the block and is reassigned to each element that is passed to the block.
# Since 'a' wasn't initialized in the outer scope, it is not available to be output.
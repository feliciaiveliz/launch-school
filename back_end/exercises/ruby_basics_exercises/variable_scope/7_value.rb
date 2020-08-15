# What will this print and why?

a = 7 # initialize value of 'a' to a value of integer 7
array = [1, 2, 3] # local variable 'array' pointing to array of integers

array.each do |element| # #each is invoked on array and pass each element of array to to the block and assign it to local variable 'element'
  a = element
end

puts a

# 3. This is method invocation w/ a block. The block can use and modify local variables that are defined outside the block.
# 'a' starts out as 7, then it is set to 1, 2 and finally 3, which is output by 'puts a'
# What will this print and why?

a = 
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

# 3. This is method invocation w/ a block. The block can use and modify local variables that are defined outside the block.
# 'a' starts out as 7, then it is set to 1, 2 and finally 3, which is output by 'puts a'
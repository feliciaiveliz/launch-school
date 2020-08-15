# What will this print and why?

a = 7 # local variable 'a' that is initialized to the integer 7
array = [1, 2, 3] # local variable 'array' that is initialized to the array that contains integers 1 2 and 3

array.each do |a| # invoking #each method on 'array'/ passing in each element to the block and assigning it to the local variable 'a'
  a += 1 # variable shadowing occurs when a block argument (|a|) hides a local variable defined outside of the block.
end # since outer 'a' is hidden, the 'a += 1' has no effect on it. 

puts a # 7
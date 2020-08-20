def exclaim(array)
  array.map {|item| yield(item)} 
end

value = '!!!'

p exclaim(["hi", "bye"]) { |n| n + value }

# Why does this return the same value as the problem above?

def exclaim(array, &block) 
  value = '!'
  array.map(&block)
end

value = '!!!'

p exclaim(["hi", "bye"]) { |n| n + value }

# Even though we aren't using 'yield' to execute the block, the block is still accessible to the method because we are passing
# it in as an explicit parameter: '&block'. That '&' prefixed to the block parameter converts that block to a simple proc object
# which is what is passed to the #map invocation on line 13. The '&' prefixed to block here as an argument to #map converts the proc to a block
# We are invoking the #map method on line 13 on the array object ['hi', 'bye'] being passed into the method as an argument.
# Each string in the array is assigned to block local variable 'n', which is then concatenated to 'value' for each iteration; this becomes the return value for the block
# The 'exclaim' method returns ['hi!!!', 'bye!!!']
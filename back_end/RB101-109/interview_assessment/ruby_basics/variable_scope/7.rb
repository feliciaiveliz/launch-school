# What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

# Method invocations with a block have different scoping rules than method definitions.
# Local variables init. in the outer scope can be reassigned in an inner scope of a block.

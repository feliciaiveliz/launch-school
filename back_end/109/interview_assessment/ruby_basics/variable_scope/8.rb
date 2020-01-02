# What will the following code print, and why? Don't run the code until you have tried to answer.

array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a # error, undefined method or local variable 'a'

# Local variable 'a' is init. within the scope of the do..end block, but this variable isn't visible in the outer scope.

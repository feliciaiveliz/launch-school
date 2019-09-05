a = 5

3.times do |n|
  a = 3
end

puts a

# a is 3 because the times method creates an inner scope and a is available to it.

a = 5

3.times do |n|
  a = 3
end

puts a

# This results in an error because b is initialized in the inner scope.
# In the code below, sun is randomly assigned as 'visible' or 'hidden'.

sun = ['visible', 'hidden'].sample

puts "The clouds are blocking the sun!" unless sun == 'visible'

# or

unless sun == 'visible'
  puts "The clouds are blocking the sun!"
end


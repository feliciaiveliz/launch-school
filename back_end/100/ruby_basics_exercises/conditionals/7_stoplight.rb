# Convert the following case statement to an if statement.

# stoplight = ['green', 'yellow', 'red'].sample

# case stoplight
# when 'green'
#   puts 'Go!'
# when 'yellow'
#   puts 'Slow down!'
# else
#   puts 'Stop!'
# end

stoplight = ['green', 'yellow', 'red'].sample

if stoplight == 'green'
  puts 'Go!'
elsif stoplight == 'yellow'
  puts "Slow down!"
else
  puts "Stop!"
end

# method will return the value passed in incremented by 3.
def add_three(n)
  n + 3 # Only line; implicitly returned
end

puts add_three(7) # returns 10


# This will throw an error because nil was returned, and it does not respond to a times call.
add_three(5).times { puts 'this should print 8 times.' }

def add_three(n)
  new_value = n + 3
  puts new_value
  new_value
end

add_three(8)

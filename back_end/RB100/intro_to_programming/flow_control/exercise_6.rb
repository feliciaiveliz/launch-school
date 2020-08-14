def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
end

equal_to_four(5)

# Two 'ends' are required for this entire method. One to complete the if/else statement and the other to complete the method itself. 

# Fixed

def equal_to_four(x)
  if x == 4
    puts "yup"
  else 
    puts "nope"
  end
end
# What will this print and why?

a = 7 # local variable 'a' is referencing integer 7

def my_value(b) 
  a = b # a is assigned to b, which is 12
  puts a
end

my_value(a + 5) # 12 is value resulted from this method
puts a
 
# a is 7 because method definitions are self contained with respect to local variables.
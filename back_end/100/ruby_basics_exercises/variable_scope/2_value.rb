# What will this print and why?

a = 7 # local variable 'a' referencing the integer 7 

def my_value(a)  # 
  a += 10
end

my_value(a) # invoke my_value and pass in 'a' as an argument
puts a # output value of 'a'  

# Method definitions are self contained with respect to local variables. Local variables inside 
# method definition are not visible outside the method definition.
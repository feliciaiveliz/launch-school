# What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7

def my_value(b)
  b = a + a
end

my_value(a) # error
puts a # 7

# Local variable 'a' is not initialized within the method definition. They are self-contained with respect to local variables.
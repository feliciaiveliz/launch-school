# What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7

def my_value(a)
  a += 10
end

p my_value(a) # 17
puts a # 7

# Method defintions are self-contained with respect to local variables. Variables within the method definition are not visible outside of it.

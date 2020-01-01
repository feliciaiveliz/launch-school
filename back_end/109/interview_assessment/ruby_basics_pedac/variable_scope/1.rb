# What will the following code print and why? Don't run it until you have tried to answer.

a = 7

def my_value(b)
  b += 10
end

p my_value(a) # 17
puts a # 7

# Local variable 'a' is initialized in the outer scope. 
# We output its value on line 10, which hasn't changed because the reassignment that happens within the method definition 
# doesn't change value of 'a' permanently.


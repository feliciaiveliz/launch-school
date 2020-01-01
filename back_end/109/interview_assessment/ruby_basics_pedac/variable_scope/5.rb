# What will the following code print, and why? Don't run the code until you have tried to answer.

a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

p my_value(a) # 'yzzyX'
puts a # 'Xyzzy'

# Local variable 'b' is set to reference the same string object that 'a' is.
# We reassign the value of 'b' which is now set to 'yzzyX'. Reassignment doesn't mutate the original object.
# What will this print and why?

a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
puts a

# 'a' is "Xyzzy" because method definitions are self-contained with respect to local variable. 
# Within the method, 'b' is assigned to 'zyyzX', while 'a' is still referencing "Xyzzy"
# What will this print and why?

a = 7

def my_value(b) # 'b' is local to this method and to points to the same value as 'a'
  b = a + a # there is no variable 'a' visible within this method. we are reassigning 'b' to 'a' + 'a'
end

# This will output 7:
def my_value(b)
  b = b + b
end

my_value(a)
puts a

# 'a' is 7. Within the method, 'b' is set to reference 14, while the reference 'a' is pointing to is unchanged.
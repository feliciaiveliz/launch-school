# What will this print and why?

a = 7

def my_value(b)
  b += 10
end

my_value(a)
puts a

# It will print 7 because a is assigned to 7 on line 3 and assignment never mutates a variable. It binds 'b' to a new object, while 'a' is still pointing to 7.
# What will this print and why?

a = "Xyzzy"

def my_value(b)
  b[2] = '-' # b is pointing to the same string as local variable 'a' 
end

my_value(a)
puts a # "Xy-zy"


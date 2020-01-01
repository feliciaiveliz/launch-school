# What will the following code print, and why? Don't run the code until you have tried to answer.

a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end

my_value(a)
puts a # "Xy-zy"

# Indexed assignment is a mutating action, this permanently changes the original string object 'a' is referencing.
# Strings are mutable; they can be mutated.
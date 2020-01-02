# 

a = 7

def my_value(b)
  a = b
end

p my_value(a + 5) # 12
puts a # 7

# The local variable outside the method definition is not visible within it and vice versa.
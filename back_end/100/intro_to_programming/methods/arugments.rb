# Defined add and subtract methods and called them. 
def add(a, b)
  a + b # Since it is the only line in the definition, it is implicitly returned.
end

def subtract(a, b)
  a - b # Same as above
end

# Passing integer values; returns 65
puts add(20, 45)

# Returns 70
puts subtract(80, 10)


# Ruby allows for us to pass a method call as an argument to other methods.
def multiply(num1, num2)
  num1 * num2
end

multiply(add(20, 45), subtract(80, 10))
# returns 4550
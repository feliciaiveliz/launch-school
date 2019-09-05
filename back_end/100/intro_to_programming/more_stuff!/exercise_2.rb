def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }

# It will print out nothing, because it is not called with .call and it will return a proc object.  


# 4. Modification of exercise 2.
def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

# Adding .call after block inside the method will activate the method. 
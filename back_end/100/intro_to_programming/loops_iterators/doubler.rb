# Original

def double(start)
  puts start * 2
end

# Using recursion

def doubler(start)
  puts start
  if start < 10
    doubler(start * 2)
  end
end

# Save the returned value of the add_three method invocation in a variable called returned value. Then it should print 7 because that's what the method call returned. 
def add_three(number)
  number + 3
end

returned_value = add_three(4)
puts returned_value


# Ruby methods ALWAYS return the evaluated result of the last line of the expression unless an explicit return comes before it. If you want to explicitly return a value, use return keyword.
def add_three(number)
  return number + 3 # explicit return
end

returned_value = add_three(4)
puts returned_value


# same output
def add_three(number)
  return number + 3 # This will number + 3 because you told it to explicitly, and will not execute last line. 
  number + 4
end

returned_value = add_three(4)
puts returned_value



def just_assignment(number)
  foo = number + 3
end

just_assignment(7)

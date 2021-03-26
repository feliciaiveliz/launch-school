# Example of a method definition that modifies its arg. permanently
a = [1, 2, 3]

def mutate(array)
  array.pop # pop mutates the caller
end

p "Before mutate method: #{a}"
mutate(a)
p "After mutate method: #{a}"



# Example of a method def that doesn't mutate the caller
a = [1, 2, 3]

def no_mutate(array)
  array.last # does not mutate caller
end

p "Before no_mutate method: #{a}"
no_mutate(a)
p "After no_mutate method: #{a}"



a = [1, 2, 3]

def mutate(array)
  array.pop
end

p "Before mutate method: #{a}"
p mutate(a)
p "After mutate method: #{a}"

# 1. a prints out as intially defined
# 2. print out the value returned by the mutate method
# 3. print out the value of a after the mutate method
=begin *The method is returning the result of array.pop back to where it's being called from. 
pop is a method in the Array class and it removes the last element of an array and returns it.
=end




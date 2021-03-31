# Using the following code, write a method called car that takes two arguments and prints a string containing the values of both arguments.

def car(make, model)
  puts "#{make} #{model}"
end

car('Toyota', 'Corolla')

# further exploration: 

def car(make, model)
  "#{make} #{model}"
end

car('Toyota', 'Corolla')
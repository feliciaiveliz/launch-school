# Write a method that accepts one argument, but doesn't require it. The parameter should default to the string "Bob" if no argument is given. The method's return value should be the value of the argument.

def assign_name(name = 'Bob')
  name
end

puts assign_name('Kevin') == 'Kevin'
puts assign_name == 'Bob'
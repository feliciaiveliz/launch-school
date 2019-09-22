=begin

Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

input: string
output: new string
rules:
- last name, first name
example: 
swap_name('Joe Roberts') == 'Roberts, Joe'
data structure: string
algorithm: 
- define swap_name method that passes in string argument
- create empty string
- split string into array of two names, then reverse array
- join the array into a string
=end

def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

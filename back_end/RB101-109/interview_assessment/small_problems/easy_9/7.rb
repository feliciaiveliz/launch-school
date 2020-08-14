=begin

Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

input: string
output: string
rules: 
- last name, comma, space, first name
data structure: string
pseudo-code: 
algorithm: 
- split string into an array of strings
- rotate the array
- join the array into a string seperated by a comma
=end

def swap_name(name)
  name.split.rotate.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

# What does this return?

def exclaim(array, block) 
  value = '!'
  array.map(&block)
end

value = '!!!'

new_proc = Proc.new  { |n| n + value }

value = '...'

p exclaim(["hi", "bye"], new_proc)

value = '?'

# The exclaim method definition returns '['hi...', 'bye...']. On line 14 we pass in an array object and a proc object, both of which are assigned to 'array' and 'block', respectively.
# On line 4 we intiialize local variable 'value' to '!' and on line 5 we invoke the #map method on array, and pass in the proc object to it as an argument.
# On line 8 we initiailze a local variable 'value' to '!!!' in the outer scope.
# On line 10 we initialize a proc object closure and assign it to local variable 'new_proc'
# On line 12 we reassign local variable 'value' to '...'
# On line 14 we pass in array object ['hi', 'bye'] and proc object 'new_proc' as arguments
# On line 16 we reassign again the 'value' local variable to the value of '?'
# This value is not accessible by the proc however because the proc object was passed to the method and used by #map before it was reassigned.
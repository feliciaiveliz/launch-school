=begin

Write a method that can rotate the last n digits of a number.

input: integer
output: integer with reversed 'n' digits
examples: 
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917
rules: 
- n represents the number of digits to rotate
- use -n to access digit of that index
data structure: integer, array, string
algorithm: 
- array, index
- convert 'n' to a negative number to access the digit
- convert integers to a string
  - 12345.to_s == "12345"
- slice portion of string that won't be rotated and save to variable
  - use '-n' to get starting point of slice and -1 for the ending point
  - use 0..(-n - 1) to reference the item at one index less than the rotating starting point
  - save the rotating portion into a variable 
- pass in the previous method to rotate the specified 'n' digits
- add the saved unrotated portion + the now rotated portion
  - convert the string into an integer
=end

def rotate_string(string)
  string[1..-1] + string[0]
end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

# Use with 'rotate_array'

def rotate_rightmost_digits(digits, n)
  nums = digits.digits.reverse
  first, second = nums[0..(-n - 1)], nums[-n..-1]
  (first + rotate_array(second)).join.to_i        
end

# Use with 'rotate_string'

def rotate_rightmost_digits(digits, n)
  nums = digits.to_s
  first, second = nums[0..(-n - 1)], nums[-n..-1]
  (first + rotate_string(second)).to_i  
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917


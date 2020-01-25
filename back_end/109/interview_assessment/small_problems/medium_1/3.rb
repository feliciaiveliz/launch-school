=begin

If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

input: integer
output: integer, find maximum rotation
rules: 
- 1st rotation: rotate first digit and append to end
- 2nd rotation: rotate second digit and append to end
- 3rd rotation: rotate third digit and append to end
- 4th rotation: rotate fourth digit and append to end
- 5th rotation: rotate the last two digits in number
- don't have to handle zeros
data structure: array of digits, integer
algorithm: 
- rotate_array returns the number rotated starting from the first number
  - this takes care of 1st rotation
- rotate_rightmost_digits returns the number rotated from the 'n' position 
- create an empty array 
  - rotated_digits = []
- convert number into a string and return the size of the string, save to variable
- number_digits = number.to_s.size
- use #downto method to loop until we reach the last (2) digits
- assign number to the r.v of the rotate_rightmost_digits method
- return the number
=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  digits = number.digits.reverse
  first, second = digits[0..(-n - 1)], digits[-n..-1]
  (first + rotate_array(second)).join.to_i        
end

def max_rotation(number)
  digits = number.to_s.size
  digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
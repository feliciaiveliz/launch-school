=begin

If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.
Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.
Note that you do not have to handle multiple 0s.

input: integer
output: integer
rules: 
- use the previous rotate_rightmost_digits method
- rotating first number- 735291 => 352917
- rotating second number- 352917 => 329175
examples: 
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845
data structure: array
algorithm: 
- define max_rotation method 
- pass in integer
- set an 'index' to 0
- create local variable array = integer.digits.reverse
- assign 'digits' = array[1..-1] + [array[0]] => this is for first digit
- iterate over array to rotate method
- until index == array.size
- assign index = 1
- assign 'num' = array.delete_at(index)
- 'digits' << 'num'
- index += 1
- return 'digits' method
=end

# def max_rotation(number)
#   array = number.digits.reverse
#   rotated_numbers = array[1..-1] + [array[0]]

#   index = 1
#   loop do 
#     num = array.delete_at(index)
#     rotated_numbers << num
#     break if index == array.size
#     index += 1
#   end
#   rotated_numbers.join.to_i
# end

# didn't work 

def max_rotation(number)
  array = number.digits.reverse
  length = array.size

  length.downto(2) do |idx|
    delete_num = array.delete_at(-idx)
    array << delete_num
  end

  array.join.to_i
end

p max_rotation(735291) 
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 
p max_rotation(8_703_529_146) == 7_321_609_845

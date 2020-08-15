=begin

Write a method that can rotate the last n digits of a number. For example:
Note that rotating just 1 digit results in the original number being returned.
You may use the rotate_array method from the previous exercise if you want. (Recommended!)
You may assume that n is always a positive integer.

input: two integers
output: integer
rules: 
- rotate the digits that match second integer 
- rotating only the last digit will result in the original integer
- mutate original integer
- n will always positive
examples: 
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
data structure: assignment or array
algorithm: 
- define rotate_rightmost_digits method
- pass in two arguments- number, digit
- invoke #digits and #reverse to put the number into an array in same order
- save to local variable numbers
- -digit to get negative of digits b/c going backwards on an array starts from -1
- neg_num = -digit
- rotate_num = numbers.delete_at(neg_num)
- numbers << rotate_num
- return numbers array
=end

def rotate_rightmost_digits(number, index)
  array = number.digits.reverse
  rotate_num = array.delete_at(-index)
  array << rotate_num
  array.join.to_i
end

# or 

def rotate_rightmost_digits(number, idx)
  array = number.digits.reverse
  rotate_num = array.delete_at(-idx)
  array.push(rotate_num).join.to_i
end

# or

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) 
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917


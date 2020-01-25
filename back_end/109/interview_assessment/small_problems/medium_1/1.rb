=begin

Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

input: array of integers
output: new array of integers, strings
rules: 
- do not modify the original array
- remove first element of array and append it to end of new array
data structure: array, strings, or single string
algorithm: 
- create an empty array called rotate_array = []
- duplicate the original array and save it to variable 'copy'
  - copy = array.dup
- assign 'rotate_array' = copy.shift
- iterate over the copy array using #reverse_each and append the values
  to 'rotate_array'
- return 'rotate_array'
=end

def rotate_array(array)
  rotated_array = []
  copy = array.dup
  rotated_array << copy.shift

  copy.reverse_each do |item|
    rotated_array.unshift(item)
  end
  rotated_array
end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

p rotate_array([7, 3, 5, 2, 9, 1])  == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]   

# Further Exploration

# String

def rotate_string(string)
  rotated_string = ''
  rotated_string << string[1..-1] << string[0]
end

def rotate_string(string)
  string[1..-1] + string[0]
end

p rotate_string("cat") == ("atc")

# Integer

def rotate_digits(number)
  digits = number.to_s
  rotated_digits = digits[1..-1] + digits[0]
  rotated_digits.to_i
end

p rotate_digits(12345) == 23451


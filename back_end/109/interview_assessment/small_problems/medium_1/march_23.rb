# Rotation (Part 1)

# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

=begin

input: array of strings or integers
output: new array rotated, first element at the end of the array
question: what should be done with the input?
- create a copy of original array
- with copy: 
  - remove first element
  - insert it at end of array
- return copy array
ALGORITM:
- use #dup to create copy of array
- initialize 'temp' to the array copy
- use #insert (-1, array.shift)
- return 'temp'
=end

def rotate_array(array)
  temp = array.dup
  temp.insert(-1, temp.shift)
  temp
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# Rotation (Part 2)

# Write a method that can rotate the last n digits of a number.
# Note that rotating just 1 digit results in the original number being returned.
# You may use the rotate_array method from the previous exercise if you want. (Recommended!)
# You may assume that n is always a positive integer.

=begin

input: integer, 'n': digits that need to rotate
output: integer with 'n' digits rotated
question: what should be done with the input?
- convert integer into an array of integers (order preserved)
- create range to start section that needs to be rotated
  - pass in section to 'rotate_array' 
  - replace section of 'integer_array' with rotated section
- convert array of integers to integer
ALGORITHM:
- initialize 'all_integers' to number (call #digits and #reverse)
- initialize 'all_integers', pass in (-n..-1) as argument
  - assign rotate_array([-n..-1]) to 'all_integers'
- convert array using #join and #to_i
=end

def rotate_array(array) # returns array that rotated
  temp = array.dup
  temp.insert(-1, temp.shift)
  temp
end

def rotate_rightmost_digits(number, n)
  all_integers = number.digits.reverse
  all_integers[-n..-1] = rotate_array(all_integers[-n..-1])
  all_integers.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# Write a method that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

=begin

input: string with letters (lowercase and uppercase) and numeric digits
output: integer, count of characters and numeric digits that occur more than once
question: what should be done with the input?
- iterate over string, with each letter:
  - downcase current letter
  - count occurrence of current letter
    - if more than 1, add 1 to 'count'
- return 0 if str is empty
ALGORITHM:
- return 0 if str is emtpy
- initialize 'count' to 0
- use #each_char and iterate:
  - use #downcase for letter
  - use string#count for each letter
    - if count > 1, increment 'count' by 1
- return count
=end

def duplicate_count(string)
  count = 0
  duplicate = []
  string = string.downcase
  
  string.each_char do |letter|    
    next if duplicate.include?(letter)
    
    if string.count(letter) > 1
      count += 1
      duplicate << letter
    end
  end
  
  count
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2
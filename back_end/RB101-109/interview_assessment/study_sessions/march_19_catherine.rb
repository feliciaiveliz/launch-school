# Create a digital root function.
# A digital root is the recursive sum of all the digits in a number.
# Given n, take the sum of the digits of n.
# If that value has two digits,
# continue reducing in this way until a single-digit number is produced.
# This is only applicable to the natural numbers.
#
# Here's how it works:
# digital_root(16)
# => 1 + 6
# => 7
#
# digital_root(942)
# => 9 + 4 + 2
# => 15 ...
# => 1 + 5
# => 6
#
# digital_root(132189)
# => 1 + 3 + 2 + 1 + 8 + 9
# => 24 ...
# => 2 + 4
# => 6
#
# digital_root(493193)
# => 4 + 9 + 3 + 1 + 9 + 3
# => 29 ...
# => 2 + 9
# => 11 ...
# => 1 + 1
# => 2

# inputs: integer
# outputs: integer less than 10 or string size 1

# algorithm: until number < 10 
# split the integer into a array of string numbers
# convert each string into a number with map
# sum that array
# the sum will set to variable n
# output n 



# def digital_root(number)
#   loop do
#     number = number.to_s.chars.map {|s| s.to_i }.sum
#     return number if number < 10
#   end
# end

# def digital_root(number)
#   return number if number < 10
#   number = number.to_s.chars.map {|s| s.to_i }.sum
#   digital_root(number)
# end

# p digital_root(10) == 1
# p digital_root(16) == 7
# p digital_root(942) == 6
# p digital_root(132189) == 6
# p digital_root(493193) == 2

# Find the missing letter
# Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.
#
# You will always get a valid array. And it will be always exactly one letter be missing. The length of the array will always be at least 2.
#
# The array will always contain letters in only one case.

# Example:
#
# ['a','b','c','d','f'] -> 'e'
# ['O','Q','R','S'] -> 'P'

# Use the English alphabet with 26 letters.

=begin

PROBLEM -
input: array of letter strings
output: letter string, missing letter
question: what should be done with input?
- create alphabet with lowercase and uppercase letters
- find missing letter of alphabet section given
ALGORITHM:
- initialize 'lower' to 'a'..'z'
- initialize 'upper' to 'A'..'Z'

- check if letter strings are uppercase or lowercase
  - for whichever case, use that alphabet
- find first letter of array, assign to 'first_letter_index'
- slice out section of alphabet to compare with input string
  - use #slice!, start at 'first_letter' up to 'array_size' plus 1
  - assign to 'alphabet_section'
- iterate over 'alphabet_section' with #each
  - check if letter is included in 'input' array
  - return 'letter' if it's not included
=end

def find_missing_letter(array)
  lower_letters = ('a'..'z').to_a
  upper_letters = ('A'..'Z').to_a
  
  if array.join == array.join.downcase
    first_letter_index = lower_letters.index(array[0])
    alphabet_section = lower_letters.slice(first_letter_index, (array.size + 1))
  else
    first_letter_index = upper_letters.index(array[0])
    alphabet_section = upper_letters.slice(first_letter_index, (array.size + 1))
  end

  alphabet_section.each do |letter|
    return letter if !array.include?(letter)
  end
end

p find_missing_letter(['O', 'P', 'Q', 'S']) == 'R'
p find_missing_letter(['F', 'G', 'H', 'J']) == 'I'
p find_missing_letter(["a","b","c","d","f"]) == "e"
p find_missing_letter(["b","d"]) == "c"
p find_missing_letter(["a","b","d"]) == "c"
p find_missing_letter(["b","d","e"]) == "c"

# Have the method division_stringified(num1, num2) take both parameters being passed, divide num1 by num2, and return the result as a string with properly formatted commas.
#
# If an answer is only 3 digits long, return the number with no commas.
#
# Example: if num1 is 123456789 and num2 is 10000 the output should be "12,346".
#
# Note: 2 divided by 3 should return '1'


=begin
inputs: integers
outputs: string with commas as needed

find the quotient of the two numbers and place the correct number of commas in my output

rules: if the number is less than 3 digits, return number as string
- if greater than 3 digits, add the commas as needed

algorithm: divide num1 by num2, check for decimals, round to nearest whole number
- format with correct number of commas
  - 

=end

# def division_stringified(num1, num2)
#   quotient = (num1 / num2.to_f).round
#   return quotient.to_s if quotient < 1000
#   result = []
  
#   quotient.to_s.chars.reverse.each_with_index do |char, idx|
#     result << char
#     result << ',' if (idx + 1) % 3 == 0
#   end
  
#   result.reverse!
  
#   if result[0] == ','
#     result.shift
#   end
  
#   result.join
# end

# p division_stringified(2, 3) == "1"
# p division_stringified(5, 2) == "3"
# p division_stringified(7, 3) == "2"
# p division_stringified(6874, 67) == "103"
# p division_stringified(503394930, 43) == "11,706,859"
# p division_stringified(1, 10) == "0"
# p division_stringified(100000, 1) == "100,000"
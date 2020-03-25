# Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.
# For n = 152, the output should be 52;
# For n = 1001, the output should be 101.

=begin

input: integer
output: integer, maximal number obtained from deleting one digit from number
problem:
- put number into an array of digits
  - delete the smallest number of array
  - convert the array back to integer
ALGORITHM:
- initialize 'numbers' to []
- use #to_s, #chars, #each_with_index to iterate:
  - use index: 
    - assign 'array' to 'n' #to_s #chars
    - use #delete_at (index)
    - push array #join #to_i to 'numbers'
- call #max to grab highest number
=end

def delete_digit(n)
  result = []
  
  n.digits.reverse.each_index do |index|
    array = n.digits.reverse
    array.delete_at(index)
    result << array.join.to_i
  end
  result.max
end

p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1

# In this kata you are required to, given a string, replace every letter with its position in the alphabet.

# If anything in the text isn't a letter, ignore it and don't return it.


# "a" = 1, "b" = 2, etc.

# Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)

=begin

input: string of words and punct.
output: new string of integers, where integer is letter position in alphabet
problem:
- map letter to positions in alphabet
- iterate over string, given a char:
  - if char is a letter, replace with position
- return string
ALGORITM:
- initialize 'alphabet' to 'a'..'z' #to_a
- initialize 'result' to []
- split string using #each_char
  - downcase character
  - if character is included in alphabet
    - use #index to grab letter's position + 1
      - push this number to string
- return string, call #join(' ')
=end

def alphabet_position(string)
  alphabet = ('a'..'z').to_a
  result = []
  
  string.each_char do |char|
    char = char.downcase
    if alphabet.include?(char)
      result << alphabet.index(char) + 1
    end
  end
  result.join(' ')
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"

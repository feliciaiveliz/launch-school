=begin

Find the total sum of angles in an n sided shape. n will be greater than 2.

input: integer, number of angles
output: integer, sum of angles
rules: 
- if 3, then total sum would return 180 (triangle)
- if 4, then total sum would return 360
algorithm: 
- if number of angles equal to 3
  - multiply by 60
- if number of angles equal to 4
  - multiply by 90
=end



############

=begin

Given a string that includes alphanumeric characters ('3a4B2d') return the expansion of that string: The numeric values represent the occurrence of each letter preceding that numeric value. There should be no numeric characters in the final string. Empty strings should return an empty string.

The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears.

string_expansion('3D2a5d2f') == 'DDDaadddddff'
string_expansion('3abc') == 'aaabbbccc'       # correct
string_expansion('3abc') != 'aaabc'           # wrong
string_expansion('3abc') != 'abcabcabc'       # wrong
string_expansion('3d332f2a') == 'dddffaa'
string_expansion('abcde') == 'abcde'

input: string
output: new string
rules: 
- no integers in final string
- if no integers in original string, return original string
- return empty string is string is empty
- number that comes before letter will determine how many times number is printed
- preserve letter case
- if only one intger, return all letters after it 'n' numner of times
algoritm: array, string
- create an empty string
- create an array that captures integers as strings
- split the string into an array of characters
  - save to variable
- iterate over the array of chars
- if the array includes that chars 
  - if it matches a number string
    - convert the string into an integer
  - 'n' times push the next letters into the new string 
  - until the character matches and integer
- when it matches an integer, 
  - that number will replace #times and will push the letters after it
  - until another number is reached
- if the string contains no integers, return string
- if string is empty, return empty string
=end
NUMBERS = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
LETTERS = ('a'..'z').to_a

def string_expansion(string)
  return "" if string.empty?
  str = string.chars
  final_string = ""
  integer = 0

  str.each_with_index do |char, index|
    # loop do 
    #   break if index == str.size
      if NUMBERS.include?(char)
        char = char.to_i
        integer = char

        if NUMBERS.include?(str[index + 1])
          next
        else 

          integer.times do 
            final_string << str[index + 1]
          end
        end
        
      elsif char == "0"
        return ""
      elsif 
      else
        return string
      end # end if/else
    # end # end loop 
  end # end str
  final_string
end

p string_expansion('3abc') # == 'aaabbbccc'       # correct
p string_expansion('3d332f2a') # == 'dddffaa'
p string_expansion('abcde') # == 'abcde'
p string_expansion('0d0a0v0t0y')
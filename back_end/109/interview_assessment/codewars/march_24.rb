# Simple Simple Simple String Expansion | 6 kyu

# Given a string that includes alphanumeric characters ('3a4B2d') return the expansion of that string: The numeric values represent the occurrence of each letter preceding that numeric value. There should be no numeric characters in the final string. Empty strings should return an empty string.
# The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears.

=begin

input: string tat contains letters and digits
output: string of letters, each multiplied by a digit
problem:
- mulitply each letter by the number before it. 
ALGORITM:
- initialize 'result' to ""
- initialize 'alphabet' to 'a'..'z' #to_a
- initialize 'digit' to 1
- split string using #chars and iterate:
  - downcase current character
  - if current char is not included in alphabet (digit)
    - assign 'digit' to current character (to_i)
  - else 
    - multiply current character by 'digit'
    - add this to 'result'
- return result
=end

def string_expansion(string)
  alphabet = ('a'..'z').to_a
  result = ""
  digit = 1
  
  string.each_char do |char|
    if !alphabet.include?(char.downcase)
      digit = char.to_i
    else
      result << char * digit
    end
  end
  result
end

p string_expansion('3D2a5d2f') == 'DDDaadddddff'
p string_expansion('3abc') == 'aaabbbccc'       # correct
p string_expansion('3d332f2a') == 'dddffaa'
p string_expansion('abcde') == 'abcde'
p string_expansion('') == ''

# Mexican Wave | 6 kyu

# In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.

=begin

input: string
output: array of string, mexican wave
problem:
- for each letter, capitalize current letter
- lowercase all the rest of letters
  - put whole string into array repeating this pattern
ALGORITHM:
- split string into array of chars using #chars and #map and #with_index
  - replace original letter with capitalized version
    - string[index].upcase
  - repeat for each word
- return array
=end

def wave(string)
  result = []
  
  string.chars.each_with_index do |_, index|
    string = string.downcase
    string[index] = string[index].upcase
    result << string
  end
  result
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

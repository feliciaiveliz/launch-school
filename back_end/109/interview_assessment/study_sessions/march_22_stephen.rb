# Complete the solution so that the function will break up camel casing, using a space between words.


=begin

input: string
output: new string spaces between words 
question: what should be done with input?
- create a new string
- add letters to string and check if current letter is uppercase
- if current letter is uppercase, check if last letter was lowercase
  - if yes, add a space to string then current letter
ALGORITM:
- initialize 'result' = ""
- split string using #each_char
- if char is uppercase, check if last char in 'result' is lowercase
- add space then char if yes, otherwise add character
- return string
=end

def solution(string)
  result = ""
  string.each_char do |letter|
    if letter == letter.upcase 
      result << " " << letter
    else
      result << letter
    end
  end
  result
end

p solution("camelCasing") ==  "camel Casing"
p solution('camelCasingTest') == 'camel Casing Test'

def solution(str)
  return [] if str.empty?
  underscore = str.slice!(-1) << '_'
  pairs = []

  until str.empty?
    pairs << str.slice!(0, 2)
  end

  if pairs[-1].size == 1
    pairs << underscore
  else
    pairs
  end

  if str.size.even?
    until str.empty?
      pairs << str.slice!(0, 2)
    end
  else
    until str.empty?
      pairs << str.slice!(0, 2)
    end
    pairs << underscore
  end
end

p solution("abcdef") #== ["ab", "cd", "ef"]
p solution("abcdefg") #== ["ab", "cd", "ef", "g_"]
p solution("") == []

# Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore ('_').

# Examples: 


=begin
create an array of strings with each element containing 2 characters, if there is an odd number of characters, the last element should include one character and an underscore

inputs: string
outputs: array of strings (size 2)

algorithm:
- create a result array
- iterate over string
- slice every 2 letters, add them to result array
- check last element of result array to see if the last element is size 1

=end

def solution(string)
  return [] if string.empty?
  result = []
  
  string.chars.each_with_index do |char, idx|
    next if idx.odd?
    result << string.slice(idx, 2)
  end
  
  result[-1] += '_' if result[-1].size == 1
  result
end

p solution('abc') == ['ab', 'c_']
p solution('abcdef') ==['ab', 'cd', 'ef']
p solution("") == []

# Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"

# Your task is to process a string with "#" symbols.

=begin

input: string
output: new string w/ no "#" symbols
ALGORITM:
- initiaize 'result' to ""
- iterate using #each_char:
  - add letter to string
  - if current letter is "#", convert string to array of chars
    - pop off last character of array, convert back to string
    - go on to next iteration
- return 'result'
=end

def clean_string(string)
  result = []
  
  string.each_char do |char|
    if char == "#"
      result.pop
    else
      result << char
    end
  end
  
  result.join
end

p clean_string('abc#d##c') == 'ac'
p clean_string('abc##d######') == ''
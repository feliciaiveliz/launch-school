=begin

Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

input: two strings
output: new string
rules: 
- short + long + short
- if first string is empty, return str that's not empty
data structure: strings
pseudo-code: 
- compare the sizes of the strings
- if the first string is shorter, then add the shorter string
  to the longest, then add it again at the end
- if the opposite, then add the longer string to the shorter one,
  then add the longer one again to the end
algorithm: 
- if the first_string size > second_string size
  first + second + first
- if the second_string size > first_string size
  second + first + second
=end

def short_long_short(first_str, second_str)
  if first_str.size < second_str.size
   first_str + second_str + first_str
  elsif first_str.size > second_str.size
   second_str + first_str + second_str
  end
end

def short_long_short(str1, str2)
  if str1.size > str2.size
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
=begin
  
Write a method that takes two strings as arguments, determines the longest of 
the two strings, and then returns the result of concatenating the shorter string, 
the longer string, and the shorter string once again. You may assume that the 
strings are of different lengths.

Input: two strings 
Output: one string
Rules: 
- putput must be concatenation of short string, long string and short string again
- strings can be of varying length
- if either of strings is empty, return the non-empty string
- if both strings are emtpy, return empty string
Examples: 
- short_long_short('abc', 'defgh') == "abcdefghabc"
- short_long_short('abcde', 'fgh') == "fghabcdefgh"
- short_long_short('', 'xyz') == "xyz"
Data Structure: 
- strings
Algorithm: 
- create short_long_short method that takes two parameters
  - first_str, second_str
- inside method: get lengths of first_str and second_str
- if first_str.length is > than second_str
  - second_str + first_str + second_str 
  - save to variable: concat_str
- else first_str.length < then second_str
  - first_str + second_str + first_str
  - save to variable concat_str
- return concat_str
- end method
=end

def short_long_short(first_str, second_str)
  if first_str.length > second_str.length
    concat_str = second_str + first_str + second_str
  else
    concat_str = first_str + second_str + first_str
  end
  concat_str
end

p short_long_short('abc', 'defgh')
p short_long_short('abcde', 'fgh')
p short_long_short('', 'xyz')
p short_long_short('', '')
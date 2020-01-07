=begin
PROBLEM:

Given a string, write a method change_me which returns the same
string but with all the words in it that are palindromes uppercased.

change_me("We will meet at noon") == "We will meet at NOON"
change_me("No palindromes here") == "No palindromes here"
change_me("") == ""
change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

Questions to Ask: 
1. What is a palindrome? 
- A word that reads the same forwards and backwards
2. Should the words in the string remain the same if they already use uppercase?
- Yes
3. How should I deal with empty strings provided as input? 
- Return the same empty string
4. Can I assume that all inputs are strings? 
- Don't worry about non-string inputs in this problem
5. Should I consider letter case when deciding whether a word is a palindrome? 
- Words should be case sensitive; 'mom' is a palindrome, 'Mom' is not
6. Do I need to return the same string object or an entirely new string? 
- Return a new string object

input: string
output: a new string
rules: 
 - Explicit:
   - every palindrome in the string must be converted to uppercase. 
   - palindromes are case sensitive ('Dad' is not a palindrome, but 'dad' is)
- Implicit: 
   - return a new string object; do not modify the original string
=end

# Second Part

=begin

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

input: string
output: array that contains substrings that are palindromes
rules: 
  - Explicit: 
    - palindrome words are case sensitive: ('abc' is not same as 'cbA')
    - returns only substrings that are palindromes
    - if string is empty, return an empty array
    - if string contains no substrings that are palindromes, return an empty array
questions: 
- what is a palindrome? 
- what is a substring?
- will inputs always be a string?
- what does case-sensitivity?
data structure: 
- array
algorithm: 
- create an empty array called 'result' that will contain all the substrings
- initialize variable 'start_substring_idx' and assign 0 to it
- initialize variable 'end_substring_idx' and assign value of 'start_substring_idx' + 1 to it
- enter loop which will break when 'start_substring_idx' is equal to 'str.size'
  - within this loop, enter another loop that will break if 'end_substring_idx' is equal to 'str.size'
    - append to the 'result' array part of the string from 'start_substring_idx' to 'end_substring_idx'
    - increment 'end_substring_idx' by 1
  - end inner loop
  - increment 'start_substring_idx' by 1
  - reassign 'end_substring_idx' to 'start_substring_idx += 1'
- end outer loop
- return 'result' array

# Check for palindromes
- inside is_palindrome? method, check whether string value is equal to its reversed value. Use
#String#reverse method
=end

def substrings(str)
  result = []
  start_substring_idx = 0
  end_substring_idx = start_substring_idx + 1

  loop do 
    break if start_substring_idx == str.size

    loop do 
      break if end_substring_idx == str.size
      result << str[start_substring_idx..end_substring_idx]
      end_substring_idx += 1
    end
    start_substring_idx += 1
    end_substring_idx = start_substring_idx += 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

# or 

def substrings(str)
  result = []
  0.upto(str.size - 2).each do |start_idx|
  (start_idx + 1).upto (str.size - 1) do |end_idx|
    result << str[start_idx..end_idx]
  end
end
result
end

=begin

Algorithm: 
substrings method

- create an empty array called 'result' which will contain all the required substrings
- initialize variable 'start_substring_idx' and assign 0 to it
- initialize variable 'end_substring_idx' and assign value of 'start_substring_idx + 1' to it
- enter loop which will break when 'start_substring_idx' is equal to 'str.size'
  - within that loop enter another loop which will break if 'end_substring_idx' is equal to 'str.size'
    - append to the result array part of the string from 'start_substring_idx' to 'end_substring_idx'
    - increment 'end_substring_idx' by 1
  - end inner loop
  - increment 'start_substring_idx' by 1
  - reassign 'end_substring_idx' to 'start_substring_idx' += 1
- end outer loop
- return 'result' array

is_palindrome? method
- check whether the string value is equal to its reversed value. Use #revers

palindrome_substrings method
- initialize a result variable to an empty array
- create an array named 'substring_arr'that contains all of the substrings of the input string
that are at least 2 characters long
- loop through the words in the substring_arr array
  - if the word is a palindrome, append it to the result array
- return the result array 
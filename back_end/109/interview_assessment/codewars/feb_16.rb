=begin

Problem 1: Counting Duplicates

Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

input: string
output: integer
rules: 
- count case-insensitive chars
- digits can be counted also
- assume the str contains only digits, letters
data structure: array, string
problem: 
- iterate over string and count each occurrence of the character
- select the characters that occur more than once
algorithm:
- What do i want to do with the input?
  - create an empty hash
  - iterate over the string
  - assign 0 as default value
  - check current char, downcase char to make it case insensitive
    - if char is already a key, add 1 to value
    - if not, make new k/v pair, set it to 1
  - continue with string
- select the k/v pairs where the values > 1
- return the keys
=end

def duplicate_count(string)
  dups = Hash.new(0)

  string = string.chars
  string.each do |char|
    if dups.include?(char.downcase)
      dups[char] += 1
    else
      dups[char] = 1
    end
  end
  dups
end

def duplicate_count(string)
  ('a'..'z').count { |c| string.downcase.count(c) > 1 }
end

p duplicate_count("") # 0
p duplicate_count("abcde") # 0
p duplicate_count("abcdeaa") # 1
p duplicate_count("abcdeaB") # 2
p duplicate_count("Indivisibilities") # 2
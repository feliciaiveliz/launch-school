=begin

In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.
Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.
You may assume that the string will always contain at least one character.

input: string
output: hash
rules: 
- lowercase: %
- uppercase: %
- neither: %
data structure: string, array, hash
algorithm: 
- create a hash and set values to 0
  - each key will be lowercase, uppercase, neither
- create an array that contains uppercased letters
- create an array that contains lowercase letters
- create a variable called percentage, set it to 0
- create variable called upper, set to 0
- create variable called lower, set to 0
- create variable called neither, set to 0
- split string into an array of chars
- iterate over the chars
- if the uppercased array contains the char
  - add 1 to upper
- if lowercased array contains char
  - add 1 to lower
- if neither contains char
  - add 1 to neither
- grab size of the array
=end

LOWER = ('a'..'z').to_a
UPPER = ('A'..'Z').to_a

def calculate_lower_percent(string, hash, lower)
  percentage = string.chars.size.to_f / lower
  final_percentage = 100 / percentage
  hash[:lowercase] = final_percentage.round(2)
  hash
end

def calculate_upper_percent(string, hash, upper)
  percentage = string.chars.size.to_f / upper
  final_percentage = 100 / percentage
  hash[:uppercase] = final_percentage.round(2)
  hash
end

def calculate_neither_percent(string, hash, neither)
  final_percentage = 100 - (hash[:lowercase] + hash[:uppercase])
  hash[:neither] = final_percentage.round(2)
  hash
end

def letter_percentages(string)
  hash = { lowercase: 0, uppercase: 0, neither: 0 }
  upper, lower, neither = 0, 0, 0
 
  lower = string.chars.count { |char| char =~ /[a-z]/ }
  upper = string.chars.count { |char| char =~ /[A-Z]/ }
  neither = string.chars.count { |char| char =~ /[^a-zA-Z]/ }

  lower = calculate_lower_percent(string, hash, lower)
  upper = calculate_upper_percent(string, hash, upper)
  neither = calculate_neither_percent(string, hash, neither)
end

def letter_percentages(string)
  hash = { lowercase: 0, uppercase: 0, neither: 0 }
  lower, upper, neither = 0, 0, 0
 
  string.each_char do |char|
    if LOWER.include?(char)
      lower += 1
    elsif UPPER.include?(char)
      upper += 1
    else
      neither += 1
    end
  end

  lower = calculate_lower_percent(string, hash, lower)
  upper = calculate_upper_percent(string, hash, upper)
  neither = calculate_neither_percent(string, hash, neither)
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef')  == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI') 

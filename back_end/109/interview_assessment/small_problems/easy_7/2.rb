=begin

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

input: string
output: hash
rules: 
- count lowercase letters
- count uppercase letters
- count neither characters
- neither chars are spaces, punc., numbers, anything other than letters
data structure: string, hash
pseudo-code: 
- create an empty hash 
- create a key called 'lowercase', 'uppercase', and 'neither' 
- split string into an array of individual chars
- iterate over the array of chars
- if char is equal to char upcased? then add one uppercase
- if char is equal to char lowercased? then add one lowercase
- else add one to 'neither'
algorithm: 
- init. hash and create key/value pairs and set the values to 0
- split string into array of chars using #chars
- use #each to iterate
- if the char is included in the lowercase array, add 1 to uppercase
  - then letter_count[uppercase] += 1
- if char == char.downcase
  - then letter_count[lowercase] += 1
- else letter_count[neither] += 1
- return letter_count hash
=end

require 'pry'

LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

def letter_case_count(string)
  letter_count = { lowercase: 0, uppercase: 0, neither: 0 }
 
  string.each_char do |char|
    if LOWERCASE.include?(char)
      letter_count[:lowercase] += 1
    elsif UPPERCASE.include?(char)
      letter_count[:uppercase] += 1
    else
      letter_count[:neither] += 1
    end
  end
  letter_count
end

p letter_case_count('abCdef 123') ==   { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123')
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

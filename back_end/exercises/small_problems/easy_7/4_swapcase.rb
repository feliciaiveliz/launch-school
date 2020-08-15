=begin

Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

input: string
output: new string
rules: 
- all uppercase letters will be lowercased
- all lowercase letters will be uppercased
- any other characters will be unchanged
examples: 
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
data structure: array, string
algorithm: 
- def swapcase(string) method
- use regex to help substitute letters
- assign to variable 'characters' variable splitting string into 'chars'
- call #map to return a new array
- pass in each char- if char matches a lowercase letter, then #upcase
- if char =~ uppercase letter, then #downcase
  - char =~ /[a-z]/, char =~ /[A-Z]/
- call #join on arrays of characters
=end

def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/ then char.upcase
    elsif char =~ /[A-Z]/ then char.downcase
    else char
    end
  end
  characters.join
end

p swapcase('CamelCase')
p swapcase('Tonight on XYZ-TV')
=begin

Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

input: string
output: string
rules: 
- if string size is odd, return 1 character
- if string size is even, return 2 characters
- if length is equal to 1, return that character
examples: 
center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
data structure: string
algorithm: 
- define center_of(string) method
- save to middle variable string.size / 2 
- if string.size.odd? 
  - return string[middle]
- if string.size.even?
  - string[middle + 1]
- end method
=end

def center_of(str)
  middle = str.size / 2
  str.size.odd? ? str[middle] : str[middle - 1] + str[middle]
end

def center_of(string)
  middle = string.size / 2
  string.size.odd? ? string[middle] : string[middle - 1, 2]
end

p center_of('I love ruby')
p center_of('Launch School')
p center_of('Launch')
p center_of('Launchschool') 
p center_of('x') 

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('La un ch') == 'un'
p center_of('Launc hs chool') == 'hs'
p center_of('x') == 'x'

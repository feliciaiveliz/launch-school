=begin

Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

input: string
output: string, middle char(s)
rules: 
- if string size is odd, return 1 char
- if string size is even, return 2 chars
data structure: string, array
pseudo-code: 
- if the string size is odd
  - retrieve the char at the index of dividing the string size by 2
- if the string size is even
  - retrieve the char at the index of dividing string size by 2 + index - 1
algorithm: 
- if string.size.odd? 
  - create variable for middle char by doing: array.size / 2
  - retrieve char by using string element reference
  - str[middle]
- if string.size.even? 
  - create variable for middle chars: (array.size / 2)
  - str[(middle - 1)..middle]
=end

def center_of(string)
  middle = string.size / 2
  string.size.odd? ? string[middle] : string[(middle - 1)..middle]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
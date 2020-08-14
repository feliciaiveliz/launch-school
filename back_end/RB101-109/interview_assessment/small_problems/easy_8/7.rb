=begin

Write a method that takes a string, and returns a new string in which every character is doubled.

input: string
output: new string
rules:
- every char in the str will be doubled
- spaces and punctuation will be doubled also
- if string is emtpy, return an empty string
- each char. * 2 
data structure: array, string
pseudo-code: 
- split str into an array of chars and iterate
- take every char and multiply it by 2
- return the new string
algorithm: 
- use #chars to split string into an array of chars
- iterate using #map to return a new array at the end
- for every 'char' that passes to the block
  - char * 2
- return the string after conversion
=end

def repeater(string)
  string.chars.map { |char| char * 2 }.join
end

# or

def repeater(string)
  result = "" 
  string.each_char do |char|
    result << char << char
  end
  result
end

p repeater('Hello') 
p repeater("Good job!")
p repeater('')

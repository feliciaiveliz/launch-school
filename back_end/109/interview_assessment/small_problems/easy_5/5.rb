=begin

Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

input: string
output: same string
rules: 
- modify the original string
- replace all non-alphabetic chars with spaces
- if 1 or more non-alpha chars exist in a row
  - replace with 1 space
- the str should never have more than 1 space in a row
example: 
cleanup("---what's my +*& line?") == ' what s my line '
data structure: string, array
pseudo-code: 
- replace all non-alpha chars with " "
- remove duplicate spaces
algorithm: 
- substitute all chars that are not letters with " "
  - gsub = /[^a-z]/
- squeeze string to remove duplicate spaces
- return original string
=end

def cleanup(string)
  string.gsub(/[^a-z]/, ' ').squeeze!
end

p cleanup("---what's my +*& line?") == ' what s my line '

ALPHABET = ('a'..'z').to_a

def cleanup(string)
  clean_chars = []

  string.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << " " unless clean_chars.last == " "
    end
  end
  clean_chars.join
end

p cleanup("---what's my +*& line?") == (' what s my line ')
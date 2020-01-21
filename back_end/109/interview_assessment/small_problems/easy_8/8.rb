=begin

Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

input: string
output: a new string
rules: 
- every consonant is doubled
- a consonant is any char that is not a number, punc, vowel (aeiou) or whitespace
- whitespace is just a space
examples: 
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
data structure: 
pseudo-code: 
- split string into an chars, iterate over the array
- create a variable that includes only the consonant chars
- double the char (char * 2) if the char is included in this collection of consonants
algorithm: 
- init. variable called 'consonant'
  - set it to array of consonants
- split string into array of chars using #chars
- iterate using #map to return a new array
- if consonants include? chars, then char * 2
- else add the char
=end

CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  string.chars.map do |char|
    CONSONANTS.include?(char.downcase) ? char * 2 : char
  end.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""


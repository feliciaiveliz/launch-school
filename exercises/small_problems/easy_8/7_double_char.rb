=begin

Write a method that takes a string, and returns a new string in which every character is doubled.

input: string
output: new string
rules: 
- every character must be doubled
- non-letter or number characters will also be doubled
- if string empty, return empty string
examples: 
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''
data structure: string, array
algorithm: 
- define repeater(string) method
- split string into array of chars and iterate over array with map
- for each |char| char * 2
- call #join on method and return string
- end method
=end

def repeater(string)
  string.chars.map {|char| char * 2}.join
end

# LS

def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
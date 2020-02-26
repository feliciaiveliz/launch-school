=begin

Problem 1: Absent Vowel

Your job is to figure out the index of which vowel is missing from a given string:
A has an index of 0,
E has an index of 1,
I has an index of 2,
O has an index of 3,
U has an index of 4.
Notes: There is no need for string validation and every sentence given will contain all vowles but one. Also, you won't need to worry about capitals.

input: string
output: integer, vowel index
rules: 
- no string validation
- don't worry about letter case
data structure: array, integers
example: "John Doe hs seven red pples under his bsket" => 0; missing: "a"
problem: 
- What do I want to do with the input?
  - grab all the vowels included in the string
  - iterate over the vowels that are in the string
    - check to see if a vowel is missing
    - if it is, retrieve index of vowel
    - if it isn't, skip iteration
algorithm: 
- What do I want to do with the input?
  - create a vowels array
  - create a variable called vowels_in_string
    - scan the string to return an array of vowels and save it to vowels_in_string
    - filter out duplicates of a vowel occurrence
  - iterate over vowels array and check if the vowel is included in vowels_in_string array
    - if it is, return the index of the vowels from the vowels array
    - if is isn't, skip iteration
=end

def absent_vowel(string)
  vowels = %w(a e i o u)
  vowels_in_str = string.scan(/[aeiou]/).uniq
  
  vowels.each do |vowel|
    next if vowels_in_str.include?(vowel)
    return vowels.index(vowel)
  end
end

def absent_vowel(string)
  vowels = %w(a e i o u)
  vowels.find_index {|v| !string.include?(v) }
end

def absent_vowel(string)
  vowels = %w(a e i o u) # ['a', 'e', 'i', 'o', 'u'] 
  vowels_in_str = string.scan(/[aeiou]/).uniq
  
  vowels.each do |vowel|
    return vowels.index(vowel) if !vowels_in_str.include?(vowel)
  end
end

p absent_vowel("John Doe hs seven red pples under his bsket")
p absent_vowel("Bb Smith sent us six neatly arranged range bicycles")
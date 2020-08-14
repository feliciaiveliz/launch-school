=begin

Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

input: array of strings
output: array of string without vowels
rules: 
- vowels are aeiou
- return new array
- preserve letter case
data structure: array, strings
pseudo-code: 
- iterate over the array of strings
- delete all vowels from the words
- return a new array of word values
algorithm: 
- map over the array of strings and delete each vowel
- capture vowel values: "aeiouAEIOU"
- return new array 
=end

def remove_vowels(array)
  array.map { |word| word.delete("aeiouAEIOU") }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))
p remove_vowels(%w(green YELLOW black white))
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

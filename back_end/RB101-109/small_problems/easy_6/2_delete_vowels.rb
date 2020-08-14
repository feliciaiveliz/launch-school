=begin

Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

input: array of strings
output: array of same string
requirements: 
- return same string but with vowels deleted
- vowels: a, e, i, o, u
- retain case
data structure: array, string
algorithm: 
- create remove_vowels(array)
- word.gsub(/[^aeiou]/i, '')
- iterate over array using map
- return array
- end method
=end

def remove_vowels(array)
  array.map! { |word| word.gsub(/[aeiou]/i, '') }
end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))
p remove_vowels(%w(green YELLOW black white)) 
p remove_vowels(%w(ABC AEIOU XYZ)) 

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']


=begin

input: string
output: array of substrings
rules: 
- substrings will be palindromic strings
- palindrome is a word that is the same forwards and backwards
- duplicate palindromes should be included
- cas sensitive- "AbcdA" is palindrome, but neither "Abcba" nor "Abc-bA" are
- single characters are not palindromes
examples: 
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
data structure: array, string
algorithm: 
- define palindrome?(string) helper method
- check to see if string == string.reverse && string.size > 1
- define palindromes(string) method
- iterate over substrings(string) method and select substrings that are palindromes
- end method
=end

def substrings_at_start(string)
  array = []
  string.size.times do |i|
    array << string[0..i]
  end
  array
end

def substrings(string)
  strings = []
  string.size.times do |i|
    strings << substrings_at_start(string[i..-1])
  end
  strings.flatten
end

def palindrome?(string)
  (string == string.reverse) && string.size > 1
end

def palindromes(string)
  substrings(string).select do |substring|
    palindrome?(substring)
  end
end

p palindromes('abcd') 
p palindromes('madam')
p palindromes('hello-madam-did-madam-goodbye')
p palindromes('knitting cassettes')

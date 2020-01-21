=begin

Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

input: string
output: array of palindromic substrings
rules: 
- r.v should be arranged in same sequence as substrings appear in string
- duplicate palindromes should be included as many times as they occur
- a palindrome is a string that reads the same forwards and backwards
- use substrings method from previous exercise
- consider all characters when determining if a str is a palindrome
- single chars are not palindromes
- palindromes are case sensitive, "AbcbA" is, but not "Abcba"
data structure: array, string
pseudo-code: 
- create a palindrome method
  - if the string is the same when it is reversed, it is a palindrome
- substrings_at_start creates all substrings from the original string
- substrings returns all of the substrings that can be made from the original string
- palindromes needs to return an array of all substrings that are palindromes
algorithm: 
- create a new array that will contain the returned palindromes
  - palindromes = []
- take the return value of the substrings method, which contains all possible substrings of a string
  and iterate over the array
- if the string that gets passed in is a palindrome, then push it to the new array
- select the value and add it to the new array
- return 'palindrome'
=end

def substrings_at_start(string)
  substrings = []
  string.size.times do |index|
    substrings << string[0..index]
  end
  substrings
end

def substrings(string)
  substrings = []
  (0..string.size).each do |start_index|
    current_substring = string[start_index..-1]
    substrings.concat(substrings_at_start(current_substring))
  end
  substrings
end

def palindromes(string)
  substrings = substrings(string)
  substrings.select { |str| str if str == str.reverse && str.size > 1 }
end

p palindromes('abcd') == []
p palindromes('madam') 
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes')
=begin

Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

input: string
output: array of strings
rules: 
- start substring from beginning of str
- return all substrings from the start of str
- arrange string from shortest to longest substring
data structure: array, string
pseudo-code: 
- create a variable 'substrings' that will contains the new substrings
- set substrings to an empty array
- iterate over the array and use the index
- slice the string into substrings using the index and each char
- push these substrings into the 'substrings' array
- return the substrings array
algorithm: 
- init. variable 'substrings' and set it to empty array []
- iterate over the string using its size, and #times
- the indexes passed to the block will be 0, 1, 2
- create a substring by including the 0 (start) and all the chars between that char (0)
  - and the 'index' as a stopping point
    - 0..0, 0..1, 0..2
  - capture these substrings into a range, 0..index
- once all substrings are pushed to 'substrings'
  - end iteration and return 'substrings'
=end

def substrings_at_start(string)
  substrings = []
  string.size.times do |index|
    substrings << string[0..index]
  end
  substrings
end

p substrings_at_start('abc')
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

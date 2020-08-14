# Triple Trouble
# Create a function that will return a string that combines all of the letters of the three inputed strings in groups. Taking the first letter of all of the inputs and grouping them next to each other. Do this for every letter, see example below!

# E.g. Input: "aa", "bb" , "cc" => Output: "abcabc"

# Note: You can expect all of the inputs to be the same length.

=begin

input: 3 strings
output: one string
problem: what should be done with input?
- for the length of str1:
  - take first letter of each string and add to new string
  - continue for legnth of str1 (all strings are same length)
algorithm:
- initialize 'triple' to ""
- use #size and #times for str1 to iterate: use 'idx' for index
  - add letter at 'idx' for each string to 'triple'
    - triple << 'abc'
- return 'triple'
=end

def triple_trouble(one, two, three)
  triple = ""
  one.size.times do |idx|
    triple << one[idx] + two[idx] + three[idx]
  end
  triple
end

p triple_trouble("aaa","bbb","ccc")
p triple_trouble("aaaaaa","bbbbbb","cccccc")
p triple_trouble("LLh", "euo", "xtr")


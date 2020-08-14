=begin

Write a method that will return a substring based on specified indices.

input: string, integer indices
output: substring 
rules: 
- the first integer  

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


p substrings(["a", "b", "c", "d"]) # ["a", "ab", "abc", "abcd"]
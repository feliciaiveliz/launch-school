=begin

Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

input: string
output: array of substrings
rules: 
- substring starts at beginning of original string
- return value should be shortest to longest ordered string
- if string is single letter, return letter
examples: 
substrings_at_start('abc') == ['a', 'ab', 'abc']
substrings_at_start('a') == ['a']
substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
data structure: string, array
algorithm: 
- define substrings_at_start(string)
- intialize empty array- array = []
- set index to 0- index = 0
- call #size and #times to iterate over string do |string|
- append to array strings and their substrings
- array << string[0..count] will add 'a' to array 
- return array
- end method
=end

def substrings_at_start(string)
  array = []
  count = 0

  string.size.times do |str|
    array << string[0..count]
    count += 1
  end

  array
end

def substrings(string)
  array = []

  string.size.times do |i|    # times goes from 0 to i times, in this case 5
    array << string[0..i]     # counter not needed
  end
  array
end

p substrings_at_start('abc') 
p substrings_at_start('a')
p substrings_at_start('xyzzy')
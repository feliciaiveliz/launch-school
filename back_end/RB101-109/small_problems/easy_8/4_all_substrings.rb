=begin

Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

input: string
output: array of substrings
rules: 
- first substring should start at a[0]
- the next substring should start at a[1]
- return value should be arranged in order from shortest to longest
data structure: string, array
algorithm: 
- use substrings_at_start(string) method
- define substrings(string) method
- create empty array- array = []
- initialize index to 0- count = 0
- initialize count to 0- count = 0
- call #size and #times to iterate over the length of string
- append to the array, the string[0..index]- this is first letter
- increment index += 1- string[0..index]= this will be first and second letter
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
  strings
end

p substrings('abcde')
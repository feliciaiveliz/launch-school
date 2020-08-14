# Write a method called 'sub_averages' that takes a nested array as parameter.
# This nested array consists of sub-arrays which contain either integers or are empty.
# The sub_averages method should return a new array that contains the average of the 
# numbers for a given sub-array.
# An empty sub-array should result in an average of zero!
# The average is the sum of all the numbers in a list, divided by the
# count of numbers in the list.
# Here are some tests the method needs to pass:

=begin

input: array of integers, or empty arrays
output: array of integers, averages of each array
problem:
- iterate over larger array:
  - find average of each subarray => sum of integers / array size
  - return array of each subarray average
- empty arrays are 0
ALGO:
- iterate over input array using #map:
  - for each subarray:
    - call sum and divde by array #size
  - if array empty, 0
- return array
=end

def sub_averages(array)
  array.map { |sub| sub.size == 0 ? 0 : sub.sum / sub.size }
end

p sub_averages([[1, 3], [2, 2, 2], [4, 7, 3, 2]]) == [2, 2, 4]
p sub_averages([[], []])                          == [0, 0]
p sub_averages([[105]])                           == [105]
p sub_averages([[22, 22, 44, 0]])                 == [22]
p sub_averages([[1, 3], [], [4, 7, 3, 2]])        == [2, 0, 4]

 # Write a method that takes two string parameters, where both strings can be
 #  any length and contain alpha-numerical characters exclusively.
 #  The method should determine all possible sub-strings that are at least 2
 #  characters long for each input string and return:
 #    - true if both input strings contain at least one one identical sub-string
 #    - false if they do not share any identical substring
 #  A substring only matches another sub-string if they contain the exact same
 #  characters in the same order and have the exact same length.
 #  All possible sub-strings in this example consist of successive characters
 #  from the original string such as for example:


# 'abc' = ['a', 'ab', 'abc', 'b, 'bc', 'c']

=begin

input: two strings
output: boolean
problem:
- find all possible substrings of a string
- check if other string contains substring with successive letters
- *case sensitive
ALGO:
- define a method called 'create_substrings' that will create all possible substrings
- pass first string into 'create_substrings'
- if first string contains substrings that are included in str2 and substring size is > 1
  - true
- false
=end

def create_substrings(string)
  substrings = []
  
  loop do 
    string.size.times do |idx|
      substrings << string.slice(0, idx + 1)
    end
    string.slice!(0)
    break if string.size == 0
  end
  substrings.select { |sub| sub.size > 1 }
end

def share_substring(str1, str2)
  str1 = create_substrings(str1)
  str1.any? { |sub| str2.include?(sub) }
end

p share_substring('abc', 'abc')                 == true
p share_substring('', 'abc')                    == false
p share_substring('i512', 'Iam512yearsold')     == true
p share_substring('BANANA', 'banana')           == false
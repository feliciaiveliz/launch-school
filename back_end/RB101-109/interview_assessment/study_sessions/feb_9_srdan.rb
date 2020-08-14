# # Example 1

# animal = "dog"

# loop do |animal|
#   animal = "cat"
#   break
# end

# puts animal

# # Example 2

# def test(str)
#   str.upcase!
#   str += '!'
# end

# test_str = "Written Assessment"
# test(test_str)

# puts test_str

# # Example 3

# def test
#   puts "written assessment"
# end

# var = test

# if var
#   puts "written assessment"
# else
#   puts "interview"
# end

# Outputs "written assessment"
# Outputs "interview"

# Example 4

# Write method scramble(str1,str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.
#
# For example:
# str1 is 'rkqodlw' and str2 is 'world' the output should return true.
# str1 is 'cedewaraaossoqqyt' and str2 is 'codewars' should return true.
# str1 is 'katas' and str2 is 'steak' should return false.
#
# Only lower case letters will be used (a-z). No punctuation or digits will be included.

=begin

input: two strings
output: boolean
rules: 
- lowercase letters only
- no punctuation or digits
data structure: array, strings
algorithm: 
- split str2 into an array of chars
- iterate over this array
- if the number of letters in str2 is greater than str1, return false
- return true otherwise
=end

require 'pry'

def scramble(str1, str2)
  str2.each_char do |letter|
    if str2.count(letter) > str1.count(letter)
      return false
    end
  end
  true
end


p scramble('javaass', 'jjss')   == false
p scramble('rkqodlw','world')  == true
p scramble('cedewaraaossoqqyt','codewars')  == true
p scramble('katas','steak')  == false
p scramble('scriptjava','javascript')  == true
p scramble('scriptingjava','javascript')  == true


Given an array of integers, Find the minimum sum which is obtained from summing each Two integers product.

Notes:
- Array/list will contain positives only
- Array/list will always has even size

Problem: 
- What's the input given? array of integers, or an empty array
- What are you going to do with the input? 
  - sort the array from smallest to largest numbers
  - take two integers- smallest * largest 
  - save the result
  - do this for length of array
  - sum those results
- What are you going to return? integer, minimum sum
=end

p min_sum([5,4,2,3]) == 22 # 5*2 + 3*4 = 22 # 5*3 + 4*2 = 23
p min_sum([12,6,10,26,3,24]) == 342 # 26*3 + 24*6 + 12*10 = 342
p min_sum([9,2,8,7,5,4,0,6]) == 74 # 9*0 + 8*2 +7*4 +6*5 = 74
p min_sum([1,2]) == 2
p min_sum([]) == 0

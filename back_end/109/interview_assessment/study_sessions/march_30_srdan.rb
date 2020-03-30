# You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

# For example:

# Let's say you are given the array [1,2,3,4,3,2,1]:
# Your method will return the index 3, because at the 3rd position of the array, the sum of left side of the index [1,2,3] and the sum of the right side of the index [3,2,1] both equal 6.

# Another one:
# You are given the array [20,10,-80,10,10,15,35]
# At index 0 the left side is []
# The right side is [10,-80,10,10,15,35]
# They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
# Index 0 is the place where the left side and right side are equal.

=begin

input: array of integers
output: integer, index of integer whose left and right sides are equal
problem:
- iterate through array and given numbers one by one:
  - sum the left side and the right side
  - if left and right are equal, return index of current number
  - if not equal, move to next number
AGORITHM:
- initialize 'left' to []
- initialize 'right' to []
- iterate over 'array' using #each_with_index, given current_number and index:
  - assign left to array 0 to (one less than) index of current number
  - assign right to array (one more than) current number to last number
    - use 'index'
  - IF left sum and right sum are equal
    - return index of current number
  - ELSE 
    - increment index by 1
  - END
- return -1 if left and right cannot be equal
=end

# def find_even_index(array)
#   left, right = [], []

#   array.each_with_index do |number, index|
#     left = array[0...index]
#     right = array[index + 1..-1]
#     if left.sum == right.sum
#       return index
#     else
#       index += 1
#     end
#   end
#   -1 
# end

# p find_even_index([1,2,3,4,3,2,1]) == 3
# p find_even_index([1,100,50,-51,1,1]) == 1
# p find_even_index([1,2,3,4,5,6]) == -1
# p find_even_index([20,10,30,10,10,15,35]) == 3
# p find_even_index([20,10,-80,10,10,15,35]) == 0
# p find_even_index([10,-80,10,10,15,35,20]) == 6
# p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3

# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You will return true if you find a
# substring that appears in both strings, or false if you do not.
# We only care about substrings that are longer than one letter long.

=begin

input: two strings
output: boolean
problem:
- check if a substring exists in both strings
- return true if there does exist a substring
- have 'create_substrings' method that returns an array of substrings
- iterate over one string:
  - if one substring is included in the other array, return true
- end
ALGORITM:
- define method 'create_substrings'
  - initilize 'substrings' to []
  - initialize 'index' to 0
  - given string, #slice
    - start from 0, index
    - next iteration, 0 to index + 1, then 0 to index + 2.
=end

def create_substrings(string)
  substrings = []
  string.downcase!
  
  loop do 
    string.size.times { |idx| substrings << string.slice(0, idx + 1) }
    string.slice!(0)
    break if string.size == 0
  end
  
  substrings.select { |substr| substr.size > 1 }
end

def substring_test(str1, str2)
  str1 = create_substrings(str1)
  str1.each { |substr| return true if str2.include?(substr) }
  false
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

# Given a string and a letter find the index of the rightmost occurrence of the letter in the string. You may not use #reverse_each or #rindex.

# inputs: string, and a letter
# ouputs: integer (index of rightmost letter from string)

# algorithm: 
# split the string into array of characters
# intitialize result array to store indices of input letter
# iterate over the string with each
# find the indices of any letter that matches the input letter
# add those indices to the result array
# find the max value of that array

def rightmost_index(string, letter)
  index_result = []
  string.chars.each_with_index do |char, idx|
    index_result << idx if char == letter
  end
  index_result[-1]
end

def rightmost_index(string, letter)
  p letter_count = string.count(letter)
  count = 0

  string.chars.each_with_index do |char, index|
    count += 1 if char == letter
    return index if letter_count == count
  end
end

p rightmost_index('I have two cats and one chicken.', 'e') == 29
p rightmost_index('Ruby is cool', 'y') == 3
p rightmost_index('Remember the Alamo', 'm') == 16
p rightmost_index('This is a sentence', 's') == 10

# Given a list lst and a number N, create a new list that contains each number of list at most N times without reordering. For example if N = 2, and the input is [1,2,3,1,2,1,2,3], you take [1,2,3,1,2], drop the next [1,2] since this would lead to 1 and 2 being in the result 3 times, and then take 3, which leads to [1,2,3,1,2,3].

=begin

input: array of integers, 'n' number
output: new array of integers, where each integer occurs 'n' times or less only
question: what should be done with input?
- iterate over array:
  - count occurrences of each integer
  - if count is <= 'n', push the numbers into a new array
  - else, take section of numbers and delete 1 until count < 3 'n'
- return array
ALGORITHM:
- initialize 'list' to []
- iterate using #each:
  - push number into 'list' and count occurrences of each number
    in 'list' using #count
  - if < 3, push the next number
  - repeat: count occurrences of each number in 'list' using #count
=end

def delete_nth(array, n)
  list = []
  array.each do |number|
    list << number if list.count(number) < n
  end
  list
end

p delete_nth([1,1,3,3,7,2,2,2,2], 3) == [1, 1, 3, 3, 7, 2, 2, 2] 
p delete_nth([20,37,20,21], 1) == [20, 37, 21]
=begin

Given a string and a letter find the index of the rightmost occurrence of the letter in the string. You may not use #reverse_each or #rindex.

input: string, letter string
output: integer, index of rightmost letter
question: what should be done with input?
- find the index of rightmost letter
- count # of 'letters' in string
- iterate through string and when 'count' is reached, return index of letter
ALGORITHM:
- initialize 'letter_count' set to string.count(letter)
- initialize 'count' to 0
- iterate using #chars and #each_with_index:
  - increment count by 1 when current letter is 'letter'
  - if 'letter_count' and 'count' are equal, return index of current letter
=end

def rightmost_index(string, letter)
  letter_count = string.count(letter)
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
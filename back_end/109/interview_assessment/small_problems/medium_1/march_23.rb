# Rotation (Part 1)

# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

=begin

input: array of strings or integers
output: new array rotated, first element at the end of the array
question: what should be done with the input?
- create a copy of original array
- with copy: 
  - remove first element
  - insert it at end of array
- return copy array
ALGORITM:
- use #dup to create copy of array
- initialize 'temp' to the array copy
- use #insert (-1, array.shift)
- return 'temp'
=end

def rotate_array(array)
  temp = array.dup
  temp.insert(-1, temp.shift)
  temp
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# Rotation (Part 2)

# Write a method that can rotate the last n digits of a number.
# Note that rotating just 1 digit results in the original number being returned.
# You may use the rotate_array method from the previous exercise if you want. (Recommended!)
# You may assume that n is always a positive integer.

=begin

input: integer, 'n': digits that need to rotate
output: integer with 'n' digits rotated
question: what should be done with the input?
- convert integer into an array of integers (order preserved)
- create range to start section that needs to be rotated
  - pass in section to 'rotate_array' 
  - replace section of 'integer_array' with rotated section
- convert array of integers to integer
ALGORITHM:
- initialize 'all_integers' to number (call #digits and #reverse)
- initialize 'all_integers', pass in (-n..-1) as argument
  - assign rotate_array([-n..-1]) to 'all_integers'
- convert array using #join and #to_i
=end

def rotate_array(array) # returns array that rotated
  temp = array.dup
  temp.insert(-1, temp.shift)
  temp
end

def rotate_rightmost_digits(number, n)
  all_integers = number.digits.reverse
  all_integers[-n..-1] = rotate_array(all_integers[-n..-1])
  all_integers.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# Write a method that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

=begin

input: string with letters (lowercase and uppercase) and numeric digits
output: integer, count of characters and numeric digits that occur more than once
question: what should be done with the input?
- iterate over string, with each letter:
  - downcase current letter
  - count occurrence of current letter
    - if more than 1, add 1 to 'count'
- return 0 if str is empty
ALGORITHM:
- return 0 if str is emtpy
- initialize 'count' to 0
- use #each_char and iterate:
  - use #downcase for letter
  - use string#count for each letter
    - if count > 1, increment 'count' by 1
- return count
=end

def duplicate_count(string)
  count = 0
  duplicate = []
  string = string.downcase
  
  string.each_char do |letter|    
    next if duplicate.include?(letter)
    
    if string.count(letter) > 1
      count += 1
      duplicate << letter
    end
  end
  
  count
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2

# Given the string of chars a..z A..Z do as in the sample cases.

=begin

input: string of letters, lowercase and uppercase
output: new string
question: what should be done with the input?
- iterate over string:
  - print letter as many times as its position
  - capitalize each 'sequence' of letters
  - combine each sequence with a "-"
- return string
ALGORITHM:
- split string and iterate using #chars and #map and #with_index
  - pass in 'char' 'index' to the block
    - letter * 'index + 1', then call capitalize on letter sequence
- call #join("-") 
=end

def accum(string)
  string = string.chars.map.with_index do |char, index|
    (char * (index + 1)).capitalize
  end
  string.join("-")
end


p accum("abcd") == "A-Bb-Ccc-Dddd"
p accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
p accum("cwAt") == "C-Ww-Aaa-Tttt"

# Given an array of strings made only from lowercase letters, return an array of all characters that show up in all strings within the given array (including duplicates). For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.

=begin

input: array of strings of lowercase letters
output: array of single letter strings or empty array
question: what should be done with the input?
- iterate over array of words:
  - split string into array of chars and sort from a to z
  - start with first word and check
    - if first letter is included in second and third word, put into array
    - continue for whole word/array
- return array of letters
ALGORITHM:
- initialize sorted_words to:
  - calling #map of word, splitting each word into chars and sorting
- iterate over sorted_words:
  - pass 'word' to block
  - 
=end

def common_chars(array)
  common_letters = []
  sorted_words = array.map { |word| word.chars.sort }
  sorted_words.each do |word|
    
end

p common_chars(["bella","label","roller"]) #== ["e", "l", "l"]
p common_chars(["cool","lock","cook"]) #== ["c", "o"]
p common_chars(["hello","goodbye","booya", "random"]) == ["o"]
p common_chars(["aabbaaaa","ccdddddd","eeffee", "ggrrrrr", "yyyzzz"]) == []

# Given a string of words, you need to find the highest scoring word.
# Each letter of a word scores points according to it's position in the alphabet:
# a = 1, b = 2, c = 3 etc.
# You need to return the highest scoring word as a string.
# If two words score the same, return the word that appears earliest in the original string.
# All letters will be lowercase and all inputs will be valid.

=begin

input: string
output: highest scoring string word
question: what should be done with input?
- create alphabet to map their postiitions (a = 1, b = 2)
- map words to their score
- find highest number from scores
- return the word with highest score
ALGORITM:
- initialize 'alphabet' to 'a'..'z' #to_a
- initialize 'word_scores' to {}
- initialize 'word_score' 0
- split string using #split and pass 'word'
- split word into chars using #chars and pass 'letter'
  - increment 'word_score' by letter position (alphabet.index(char)) + 1
- update hash: word_scores[word] = word_score
- call #values on word_scores and #max to grab highest number
- use #key to retrieve word of highest value
=end

def alphabet_score(string)
  alphabet = ('a'..'z').to_a
  word_scores = {}
  
  string.split.each do |word|
    word_score = 0
    
    word.each_char do |char|
      word_score += alphabet.index(char) + 1
    end
    
    word_scores[word] = word_score
  end
  highest_score = word_scores.values.max 
  word_scores.key(highest_score)
end
p alphabet_score('man i need a taxi up to ubud') == 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'
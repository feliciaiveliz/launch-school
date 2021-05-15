=begin
Have the method letter_changes(str) take the str parameter being passed and
modify it using the following algorithm. Replace every letter in the string
with the 3rd letter following it in the alphabet (ie. c becomes f, Z becomes C).
Then return this modified string.

input: string
output: new string
rules:
- replace letter with 3rd letter following it in alphabet
- ignore anything that's not a letter, add it to string as is
- if letter is capital letter, add 3rd letter following it as capital
data structures: string, array
problem:
- What do i want to do with the input?
  - map letters in alphabet with their positions
  - iterate over the string and replace each letter with it's 3rd follow. letter
  - add punct/digits to str as it is, then move on to the next char
  - if we add 3 to current letter index, and it 's greater than or equal to array size,
    start over from beginning of alphabet
algorithm:
- create an array of upper letters
- create array of lower letters
- create an empty array to add letters to
- split the string into an array of chars
- iterate:
  - if the char is included in the lower array
    - assign to index the index of the letter i need (3rd)
    - add it's 3rd following letter to the new array
  - if the char is included in the upper array
    - add it's 3rd following letter to the new array
  - if it's not included in either array
    - add char into the array
  - if the index of the 3rd char is >= array
=end

def letter_changes(string)
  upper = ("A".."Z").to_a
  lower = ("a".."z").to_a
  result = []

  string.each_char do |char|
    if upper.include?(char)
      index = (upper.index(char) + 3) % 26
      result << upper[index]
    elsif lower.include?(char)
      index = (lower.index(char) + 3) % 26
      result << lower[index]
    else
      result << char
    end
  end
  result.join
end

string.each_char do |char|
  if upper.include?(char)
    result << upper[(upper.index(char) + 3) % 26]
  elsif lower.include?(char)
    result << lower[(lower.index(char) + 3) % 26]
  end
  result
end

p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')

###########################################################

# Write a method that takes in a number and returns a string, placing
# a dash in between odd digits.

=begin
input: integer
output: string, integer with dashes between odd numbers
problem:
- iterate over the string for each number
- if odd, and previous number is odd
  - add a dash then the number
- if not, add the number as is
- return string
algorithm:
- initialize 'result' to ""
- put number into array using #digits and #reverse
- iterate over the array using #each
- given 'n'
  - if 'n' is odd and result[-1].to_i is odd?
    - add '-' and 'n'.to_s to result
  - else
    - result << n.to_s
  - end
- return result
=end

def dasherizer(integer)
  new_string = ""
  array = integer.to_s.chars

  array.each_with_index do |char, index|
    if char.to_i.even?
      new_string << char
    elsif char.to_i.odd? && array[index + 1].to_i.odd?
      new_string << char << "-"
    else
      new_string << char
    end
  end
  new_string
end

def dasherizer(integer)
  dash_string = ""
  array = integer.to_s.chars

  array.each_with_index do |char, index|
    if char.to_i.odd? && array[index + 1].to_i.odd?
      dash_string << char << "-"
    else
      dash_string << char
    end
  end
  dash_string
end

def dasherizer(number)
  result = ""
  number.digits.reverse.each do |n|
    if n.odd? && result[-1].to_i.odd?
      result << '-' << n.to_s
    else
      result << n.to_s
    end
  end
  result
end

p dasherizer(2112) == '21-12'
p dasherizer(201105742) == '201-105-742'
p dasherizer(123456789) == '123456789'
p dasherizer(21121) == '21-121'

#######################################################

# Given a string of words, you need to find the highest scoring word.
# Each letter of a word scores points according to it's position in the alphabet:
# a = 1, b = 2, c = 3 etc.
# You need to return the highest scoring word as a string.
# If two words score the same, return the word that appears earliest in the original string.
# All letters will be lowercase and all inputs will be valid.

=begin
input: string of words
output: string, highest scoring word
problem:
- map letters to positions in alphabet
- total up letter scores to find total word score
- find the highest scoring word
ALGO:
- initialize 'alphabet' to range: 'a'..'z'
- initialize 'word_scores' to {}
- split string into array of words using #split and #each
- initialize 'word_score' to 0
- split word into characters using #each_char
  - given letter
    - increment word_score by letter position using #index: alphabet.index(leter) + 1
- update 'word_scores' with word as key and word_score as value
- find highest number using #values and #max
- return the word using #key
=end

def alphabet_score(string)
  alphabet = ('a'..'z').to_a
  scores = {}

  string.split.each do |word|
    word_score = 0
    word.each_char do |letter|
      word_score += alphabet.index(letter) + 1
    end
    scores[word] = word_score
  end

  scores.key(scores.values.max)
end

p alphabet_score('man i need a taxi up to ubud') == 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'

####################################################

=begin

input: array of arrays, with 0s and 1s
output: array of two integers, row index of mine, and column index of mine location
problem:
- iterate over larger array, given subarray:
  - find element that is equal to 1
  - return index of current array in the larger array
  - return index of the mine location in the current array
- return both indexes in an array
ALGORITHM:
- initialize 'result' to []
- iterate over 'field' using #each, given 'row'
  - if 'row' includes 1, use #index on 'field',pass in 'row'
    - push this index to 'result'
  - use #find_index to find the element's index that equals 1
- return 'result'
=end

def mine_location(field)
  result = []
  field.each do |row|
    if row.include?(1)
      result << field.index(row)
      result << row.find_index { |n| n == 1 }
    end
  end
  result
end

###################################

input: string
output: new string
rules:
- for char of each sequence should be capitalized
- the rest of the letters are lowercased
- the sequences are seperated by "-"
- the char's position in the str determines how many chars are printed
  - a is first, a is printed once
algorithm:
- create a new array
- split the str argument into an array of chars
- save this to a variable
- return the size of the string
  - this size will be used to calc. how many letters are printed
- for the size of the string, iterate that many times
- push the current letter captialized to the array
- plus the letter lowercased (n) times to the array
- once iteration is done, join the array into a string
- each sequence will be joined by a "-"
- return the array
=end

def accum(string)
  string.chars.map.with_index do |letter, index|
    (letter * (index + 1)).capitalize
  end.join("-")
end

#################

p sum_consecutives([1,4,4,4,0,4,3,3,1])
p sum_consecutives([1,1,7,7,3])
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]

# let alphabet = 'abcdefghijklmnopqrstuvwxyz';
#
# function solve(array) {
#   let result = [];
#
#   for (let i = 0; i < array.length; i++) {  // return result
#     let word = array[i].toLowerCase();
#     let count = 0;
#
#     for (let j = 0; j < word.length; j++) { // increment count variable
#       let letter = word[j];
#       if (j === alphabet.indexOf(letter)) {
#         count += 1;
#       }
#     }
#     result.push(count) // add count to result
#   }
#
#   return result;
# }

##########################################################################

# var capitals = function (word) {
# 	word = word.split('');
#   let result = [];
#
#   for (let i = 0; i < word.length; i++) {
#     if (word[i] == word[i].toUpperCase()) {
#       result.push(i);
#     }
#   }
#
#   return result;
# };
#
# console.log(capitals('CodEWaRs')) == [0,3,4,6]

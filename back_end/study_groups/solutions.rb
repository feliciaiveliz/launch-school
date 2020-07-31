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
output: string
rules: 
- place a dash between odd numbers
- inputs will be valid positive integers only
data structure: string, array
algorithm: 
- convert the integer to a string to_s
- create an empty string
- iterate over the string 
  - if the number is even 
    - push the integer to the string
  - if the number is odd and the number at (index + 1) is also odd
  - push odd number
  - place a dash after it
  - push the next number
- continue for the rest of string
- return the string
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
- initialize 'alphabet' to 'a'..'z' 
- intialize 'word_scores' to {}
- iterate using #split, given word:
  - initialize 'word_score' to 0
    - iterate using #each_char, given letter => ADD UP LETTER SCORES
      - increment word_score += alphabet index of 'letter' + 1
  - update the hash with key as 'word' and value as 'word_score'
- use #values on 'word_scores' and #max => FIND HIGHEST NUMBER
- use #key on 'word_scores' to return the highest scoring word
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
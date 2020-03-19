# Given a string of words, you need to find the highest
# scoring word.
# 
# Each letter of a word scores points according to it's
# position in the alphabet:
# 
# a = 1, b = 2, c = 3 etc.
# 
# You need to return the highest scoring word as a string.
#
# If two words score the same, return the word that appears
# earliest in the original string.
#
# All letters will be lowercase and all inputs will be valid.

=begin

PROBLEM - 
input: string
output: string, highest scoring word
question: what should be done with the input?
- find scores of each character
- find total score of each word
- find highest scoring word
ALGORITM:
- initialize 'LETTERS' to range: 'a' to 'z'
- initialize 'POSITIONS' to range: 1 to 26
- zip both variables and convert to hash
- initialize 'word_scores' to {}
- initialize 'largest_score' to 0
- use #split and #each: pass 'word' to block
- intialize 'word_score' to 0; this needs to reassign to 0 for each word
- use #chars to split word into letters: pass 'letter' to block
- assign to 'word_score' each letters score:
  - increment by alphabet[letter] for each word
  - with total word score:
    - update 'word_scores' hash with 'word' as key and 'value' as score
- use #values to grab all word scores into array
- use #max to find highest scoring word
  - save to 'largest_score'
- use #key to retrieve the word of the largest score
=end

LETTERS = ('a'..'z').to_a
POSITIONS = (1..26).to_a
ALPHABET = LETTERS.zip(POSITIONS).to_h

def alphabet_score(string)
  word_scores = {}

  string.split.each do |word|
    word_score = 0
    word.chars.each do |letter|
      word_score += ALPHABET[letter]
      word_scores[word] = word_score
    end
  end
  

  largest_score = word_scores.values.max
  word_scores.key(largest_score)
end

LETTERS = ('a'..'z').to_a

def alphabet_score(string)
  word_scores = {}

  string.split.each do |word|
    word_score = 0
    word.chars.each do |letter|
      word_score += LETTERS.index(letter) + 1
      word_scores[word] = word_score
    end
  end

  largest_score = word_scores.values.max
  word_scores.key(largest_score)
end

p alphabet_score('man i need a taxi up to ubud') == 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'
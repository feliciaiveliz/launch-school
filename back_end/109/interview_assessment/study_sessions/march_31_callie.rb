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
- initialize 'highest_score' to 0
- iterate using #split, given word:
- initialize 'word_score' to 0
  - iterate using #each_char, given letter
    - increment word_score += alphabet index of 'letter' + 1
  - end
- update the hash with key as 'word' and value as 'word_score'
- use #values on 'word_scores' and #max, save to 'highest_score'
- use #key on 'word_scores' to return the highest scoring word
=end

def alphabet_score(string)
  alphabet = ('a'..'z').to_a
  word_scores = {}
  highest_score = 0
  
  string.split.each do |word|
    word_score = 0
    word.each_char do |letter|
      word_score += alphabet.index(letter) + 1
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

def kebabize(str)
  result = ""
  str = str.delete('^A-Za-z')
  
  str.each_char do |letter|
    if letter == letter.upcase
      result << '-' << letter.downcase
    else
      result << letter
    end
  end
  if result.start_with?('-')
    return result[1..-1]
  else
    return result
  end
end

=begin

input: string
output: string, in kebab case
problem:
- no integers in final string
- only have lowercase letters in final string
- delte anyting that's not a letter
- iterate over string:
  - add letters to new string
  - if current letter is a capital letter:
    - add "-", lowercase current letter, add current letter
  - continue for length of string
ALGO:
- initialize 'result' to ""
- delete anything from str that is not included in 'lowercase'
- split string into array of chars using #chars, given letter
  - if letter is capital letter, 
    - result << '-" << current letter upcased
  - else
    - result << letter
  - end
- return 'result'
=end
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

def kebabize(str)
  result = ""
  str = str.delete('^A-Za-z')
  
  str.each_char do |letter|
    letter == letter.upcase ? result << '-' << letter.downcase : result << letter
  end

  return result[1..-1] if result.start_with?('-')
  return result
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

def duplicate_count(text)
  count = 0
  duplicates = []
  text.downcase!
  
  text.each_char do |letter|
    next if duplicates.include?(letter)
    if text.count(letter) > 1
      count += 1
      duplicates << letter
    end
  end
  count
end

=begin

input: string
output: integer, number of letters that occur more than once
problem:
- downcase string
- iterate over string, given letter, 
  - count # of each letter
  - if count > 1, add 1 to 'count'
  - add that letter to an array to keep track of duplicate letters
  - skip letters that are already included in array duplicates
- return 'count'
ALGO:
- initialize 'count' to 0
- intiialize 'duplicates' to []
- downcase string and iterate using #each:, given letter
  - skip iteration if letter is included in 'duplicates'
  - if string count of letter > 1
    - incrmenet count by 1
    - add letter to duplicates
- return 'count'
=en
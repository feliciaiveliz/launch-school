# Given a string of words, you need to find the highest scoring word.

# Each letter of a word scores points according to it's position in the alphabet:
# a = 1, b = 2, c = 3 etc.

# You need to return the highest scoring word as a string.

# If two words score the same, return the word that appears earliest in the original string.

# All letters will be lowercase and all inputs will be valid.

=begin

Problem: 
input: string
output: string, single word
rules: 
- letter score 
  a = 1, b = 2, c = 3, z = 26
- if two words are the same score, return the earliest occuring word
- don't worry letter case
data structure: hash, array, strings

pseudo-code: 
- create an array to hold the letters, use index + 1 for score
  - LETTERS.index(char) + 1
- create a hash to hold the word and its score
  - word_scores = { 'man' => int, 'i' => int }
- FIRST LOOP
  - create variable word_score and set it to 0
  - split str into an array of seperate words; ['man']
- SECOND LOOP
- split words into chars
- for each word, sum up the score of each 'char' 
  - variable holds total score of word
  - score += LETTERS.index(char) + 1
  - word_scores[word] = 'score', needs to happen after score it calc.
- once i have the hash with the words and their scores
  - isolate the scores into an array, Hash#values
  - find the maximum value (highest number), Hash#values.max
  - use the max value to retrieve the key, which is the word #hash.key(highest number)
  - return the word
=end

LETTERS = ('a'..'z').to_a

def alphabet_score(string)
  word_scores = {}
  
  string.split.each do |word|
    score = 0
      
      word.chars.each do |char|
        score += LETTERS.index(char) + 1
      end
    
    word_scores[word] = score
  end

  highest_score = word_scores.values.max
  word_scores.key(highest_score)
end

# or

# Use a hash to capture score values of each letter

LETTERS = ('a'..'z').to_a
SCORES = (1..26).to_a
LETTER_SCORES = LETTERS.zip(SCORES).to_h

def find_score(word)
  score = 0
  word.each_char do |char|
    score += LETTER_SCORES[char] 
  end
  score
end

def alphabet_score(string)
  word_scores = {}
  string.split.each do |word|
    word_scores[word] = find_score(word)
  end
  highest_score = word_scores.values.max
  word_scores.key(highest_score)
end

p alphabet_score('man i need a taxi up to ubud') == 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'


############ Mandy's Attempt #############
=begin
Input: String, words
Output: String, one word - with highest score

Rules:
- a = 1
- b = 2
- c = 3

Data structure:
- Hash
- key: word
- value: score

Algo:
- initialize constant alphabet = ['a'..'z']
- initialize an empty Hash as variable result
- Use String#split to convert input String to Array
- Iterate through the Array, each item is a word
  - result['word'] = find_score()

- Subprocess, find_score: Given ONE word, find it's score
- initialize score = 0
- Use String#chars to convert word string into Array of characters
- Iterate through Array
  - score += aplhabet.index(letter) + 1
- return score

subprocess: highest scoring word
- highest_score = result.values.max , gives highest score
- highiest_score_word = result.select {|key, _| key.value == highest_score}
=end

# ALPHABET = ('a'..'z').to_a

# def find_score(word)
#   score = 0
#   word.chars do |char|
#     score += ALPHABET.index(char) + 1
#   end
#   score
# end

# # p find_score('aaa')
# # p find_score('abc')

# def alphabet_score(str)
#   result = {}
#   str.split do |word|
#     result[word] = find_score(word)
#   end

#   highest_score = result.values.max
#   result.key(highest_score)
# end

# p alphabet_score('man i need a taxi up to ubud') == 'taxi'
# p alphabet_score('what time are we climbing up the volcano') == 'volcano'
# p alphabet_score('take me to semynak') == 'semynak'
# p alphabet_score('aa b') == 'aa'


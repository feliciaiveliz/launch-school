=begin

input: string word; array of string words
output: array of words that are anagrams of input word
problem:
- sort each word and determine if it is equal to the input string sorted
- if it is, add it to the results array
algorithm:
- save a copy of input word to 'word_copy'
- initialize 'anagrams' to []
- iterate over words, given 'word':
  - downcase the word
  - add to 'anagrams' if word.chars.sort == 'input' word.chars.sort 
    - and if 'word' != to 'input_word'
- return anagrams
=end

class Anagram
  def initialize(string)
    @string = string.downcase.chars.sort
    @string_copy = string.clone
  end

  def match(words)
    words.select do |word|
      word = word.downcase
      sorted_word = word.downcase.chars.sort
      sorted_word == @string && word != @string_copy
    end
  end
end

class Anagram
  def initialize(word)
    @original_word = word
    @sorted_word = word.downcase.chars.sort
  end

  def match(array)
    array.select do |anagram| 
      anagram = anagram.downcase
      (anagram.chars.sort == @sorted_word) && (anagram != @original_word)
    end
  end
end

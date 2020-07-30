=begin
input: array of words; single string word
output: array of word(s)
algorithm:
- save word to '@word'
- 
=end

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

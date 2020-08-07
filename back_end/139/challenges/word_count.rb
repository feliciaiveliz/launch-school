=begin
input: string word or words
output or return value: hash (keys => string word; values => integer count)
problem:
- count each occurrence of a word
- save that word and count together
- make sure all words are lowercase
- ignore punctuation
algorithm:
- split word on spaces and commas
- iterate over the sentence using #each
- downcase the word
- skip word if its second to last character is a "'"
- delete anything that is not a letter or digit: '^a-z0-9'
- delete any spaces left in the array
- invoke #tally to get a count of each word
=end

class Phrase
  def initialize(sentence)
    @sentence = sentence.split(/[, ]/)
  end

  def word_count
    @sentence.each do |word|
      word.downcase!
      next if word[-2] == "'"
      word.delete!('^a-z0-9')
    end
    @sentence.delete('')
    @sentence.tally
  end
end

# another solution

class Phrase
  def initialize(string)
    @string = string
  end

  def word_count
    words_hash = Hash.new(0)
    words.each do |word|
      words_hash[word] += 1 
    end
    words_hash
  end

  def word_count
    words_array = @string.split(/[^a-z0-9']/i)
    words_array.delete('')
    words_array.map do |word|
      word = word[1..-2] if word[0] == "'" && word[-1] == "'"
      word.downcase
    end.tally
  end
end


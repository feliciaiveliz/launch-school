=begin

input: string
output: new string
problem:
- returned string should contain words seperated by a single space
- last word will end with a period
- odd words will be reversed; even words will be copied as is
- remove all extra spaces and punctuation
- reverse the odd words at odd indexed places
algorithm:
- delete anything from the string that is not a letter and spaces
- remove duplicate spaces using #strip
- save this new string into 'clean_words'
- split string into individual words using #split
- 'clean_words' = iterate using #map and #with_index, given 'word' and 'idx'
  - reverse 'word' if 'idx' odd?
- convert with #join(' ')
- << '.' on returned string if @sentence[-1] == '.'
- otherwise return clean_words
=end

class OddWords
  def initialize(sentence)
    @sentence = sentence
  end

  def reverse!
    clean_words = @sentence.delete('^a-z ').strip
    clean_words = clean_words.split.map.with_index do |word, idx|
      word = word.reverse if idx.odd?
      word
    end.join(' ')
    @sentence[-1] == '.' ? clean_words << '.' : clean_words
  end
end

class OddWords
  def initialize(sentence)
    @sentence = sentence
  end

  def self.reverse!(string)
    OddWords.new(string).reverse!
  end

  def reverse!
    clean_words = @sentence.delete('^a-z ').strip
    clean_words = clean_words.split.map.with_index do |word, idx|
      idx.odd? ? word.reverse : word
    end.join(' ')
    @sentence[-1] == '.' ? clean_words << '.' : clean_words
  end
end

p OddWords.new('').reverse! == ''
p OddWords.new('.').reverse! == '.'
p OddWords.new(' pizza.').reverse! == 'pizza.'
p OddWords.new('whats the matter with kansas').reverse! == 'whats eht matter htiw kansas'
p OddWords.new('i rather  hang out with. my  cat  .').reverse! == 'i rehtar hang tuo with ym cat.'
p OddWords.new('felicia  iveliz   khan  bacon').reverse! == 'felicia zilevi khan nocab'


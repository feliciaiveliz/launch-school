=begin

input: word or string of words
output: new word or string of words
problem: 
- if word starts with consonant: + first letter to end of word + 'ay'
- if word starts with a vowel: + 'ay' to end of word
- if 'ch', 'qu', 'squ', 'th', 'thr', 'sch'
  - move 'prefix' to end of word + 'ay'
- if word starts with 'xr' then + 'ay'
- if word starts with 'xe' then << 'x' + 'ay'
- return new word with above changes
algorithm:
- define a class method called 'translate'(word)
- split word into array of chars using #chars
- if array[0].start_with?('aeiou')
  - word << 'ay'
  - join word
- else
  - case
    if word starts with 'ch'
      - insert at -1, word.shift(2)
      - flatten word and join
  - rest of cases
=end
# vowels = ['a','e','i','o','u','yt', 'xr'] += 'ay'
# TWO_LETTER_WORDS = ['qu', 'ch', '*qu', 'th',  'xe']
# THREE_LETTER_WORDS = ['thr', 'sch']

class PigLatin
  def self.translate(word)
    if word.start_with?(/[aeiou]/)
      return word << 'ay'
    elsif word.start_with?(/(ch|qu|th)/)
      word = word.chars
      return (word.insert(-1, word.shift(2)) << 'ay').flatten.join
    elsif word.start_with?(/(thr|squ|sch)/)
      word = word.chars
      return (word.insert(-1, word.shift(3)) << 'ay').flatten.join
    elsif word.start_with?('xe')
      word = word.chars
      return (word.insert(-1, word.shift(1)) << 'ay').flatten.join
    elsif word.start_with?('xr')
      return word << 'ay'
    else
      word = word.chars
      return (word.insert(-1, word.shift(1)) << 'ay').flatten.join
    end
  end
end

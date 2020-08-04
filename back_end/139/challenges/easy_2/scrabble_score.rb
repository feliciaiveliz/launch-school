=begin

input: string of one or more words or nil
output: integer, total word score
problem:
- map each letter to its scrabble score
- calculate total score for each word
- return word with highest score
edge cases: 
- empty strings are 0
- tab and newline characters are 0
- nil is 0
- downcase all characters
algorithm:
- initialize 'scrabble_values': 
  - key as array of letters, value as value
- initialize 'scrabble_score' to 0
- split string into characters using #each_char
- given letter:
  - skip if current character is anything but a letter
  - case statement
    if included in [A, E, I, O, U, L, N, R, S, T] then scrabble_score += 1
    ... until Q, Z
- return scrabble_score
=end

ONE = %w(a e i o u l n r s t)
TWO = %w(d g)
THREE = %w(b c m p)
FOUR = %w(f h v w y)
FIVE = %w(k)
EIGHT = %W(j x)
TEN = %w(q z)

class Scrabble
  def initialize(word)
    @word = word
  end

  def self.score(word)
    Scrabble.new(word).score
  end
  
  def score
    scrabble_score = 0
    return 0 if @word == nil

    @word.each_char do |letter|
      letter = letter.downcase
      next if !('a'..'z').include?(letter)
      case 
      when ONE.include?(letter) then scrabble_score += 1
      when TWO.include?(letter) then scrabble_score += 2
      when THREE.include?(letter) then scrabble_score += 3
      when FOUR.include?(letter) then scrabble_score += 4
      when FIVE.include?(letter) then scrabble_score += 5
      when EIGHT.include?(letter) then scrabble_score += 8
      else
        scrabble_score += 10
      end
    end
    scrabble_score
  end
end
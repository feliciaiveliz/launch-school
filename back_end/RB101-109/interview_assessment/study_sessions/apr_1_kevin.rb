def string_expansion(s)
  digits = %w(0 1 2 3 4 5 6 7 8 9)
  result = ""
  number = 1
  
  s.each_char do |char|
    if (0..9).to_a.map(&:to_s).include?(char)
      number = char.to_i
    else
      result << char * number
    end
  end
  result
end

=begin

input: string
output: string w/ no digits
problem:
- iterate: 
  - if the current char is a number, assign to variable
  - if next char is a letter, print letter 'number' times
  - if next char is not, reassign number to variable
ALGO:
- initialize 'result' to ""
- initialize 'digits' to ['0-9']
- initilaize 'number' to 1
- iterate using #each_char, given 'char'
  - if char is included in 'digits' array
    - assign to 'number'
    - convert to integer
  - else
    - result << letter * number
  - end
- return result
=end

# most common char in a string and how often it occurs

=begin

input: string
output: string, single char and how often it occurs
problem:
- create a hash: 
  - keys => letters
  - values => count of letters
- get all values, and find the highest number
- use that number to retrieve the letter
ALGO:
- initialize 'letter_count' to {}
- initialize 'result' to []
- iterate using #each_char, given letter:
- update hash: [letter] = word.count(letter)
- use #values and #max to get highest count
- use #key on 'letter_count' to get the letter
  - push the letter to array
  - push the count
- return result
=end

def highest_count(string)
  letter_count = {}
  result = []
  
  string.each_char do |letter|
    letter_count[letter] = string.count(letter)
  end
  
  highest_count = letter_count.values.max
  letter = letter_count.key(highest_count)
  result << letter << highest_count
end

p highest_count("aaaabbcccccccc") == ["c", 8]

=begin

input: string
output: new string with cases of letters swapped, and reversed words
problem:
- for each word, swap the case
- for whole string, reverse the words themselves
- return string
ALGO:
- iterate using #each_char, given char
  - if letter is capital letter, downcase ltter
    - add it to array
  - if letter is lowercase letter, upcase ltter
    - add it to array
  - else
    - add it array
  - end
- reverse array
- join
- return result
=end

def string_transformer(str)
  result = []
  final = ""
  
  str.each_char do |char|
    if char == char.upcase
      result << char.downcase
    elsif char == char.downcase
      result << char.upcase
    else
      result << char
    end
  end
  result = result.join
  result
end

p string_transformer("You Know When  THAT  Hotline Bling") # "bLING hOTLINE  that  wHEN kNOW yOU"
# p string_transformer("Example Input") # "iNPUT eXAMPLE"
# p string_transformer(" A b C d E f G ") # " g F e D c B a "
# p string_transformer("To be OR not to be That is the Question") # "qUESTION THE IS tHAT BE TO NOT or BE tO"
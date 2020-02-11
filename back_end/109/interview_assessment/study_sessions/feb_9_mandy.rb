=begin

Given a string, replace every letter with its position in the alphabet.
If anything in the text isn't a letter, ignore it and don't return it.
"a" = 1, "b" = 2, etc.


Problem: 
- What's the input given? string that contains letters, punctuation 
- What are you going to do with the input? 
  - find the letters position in the alphabet
  - check if the 'char' is a letter
    - if it is, replace it with number
    - if it isn't, skip it
- What are you going to return? new string

Algorithm:
- find the letters position in the alphabet
  - Use a hash- key: letter value: integer
  - create variables for letters, numbers - Constants
  - create two arrays, one for letters, one for numbers 1-26
  - create a variable alphabet - constant
  - zip both arrays into one array of alternating letters/numbers, convert to hash
- create an empty array, save to variable 'result'
- split the string into an array of chars
- check if the 'char' is a letter
  - downcase the letter to check the char in the array of lowercased letter ***
  - if the char is included in the letters array
  - retrieve the letter's value (position), push it to the array
  - if it is not included, skip that iteration ***
- join the array into a string, seperating the numbers with spaces
- return that 'result' string
=end

LETTERS = ('a'..'z').to_a
POSITIONS = (1..26).to_a
ALPHABET = LETTERS.zip(POSITIONS).to_h

def alphabet_position(string)
  result = []
  
  string.chars.each do |char|
    if LETTERS.include?(char.downcase)
      result << ALPHABET[char.downcase]
    end
  end
  
  result.join(' ')
end

def alphabet_position(string)
  string.chars.map do |char|
    ALPHABET[char.downcase] if LETTERS.include?(char.downcase)
  end.join(' ')
end

  
p alphabet_position("The sunset sets at twelve o' clock.") #== "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"


=begin

Problem 9: Replace with Alphabet Position

In this kata you are required to, given a string, replace every letter with its position in the alphabet.
If anything in the text isn't a letter, ignore it and don't return it.
"a" = 1, "b" = 2, etc.

input: string
output: new string
rules:
- a = 1, b = 2, ..., z = 26
- skip chars that are not letters
- seperate numbers by a space
problem: 
- map letters to their position in alphabet
- convert string into a collection of individual letters to iterate over
- check if char is a letter
- if it is, replace it with it's position in alphabet
- if it is not, skip it
- return the new string of numbers
algorithm:
- map letters to their position in alphabet
  - create an array of letters a-z 
- create an empty array to hold numbers
- convert string into a collection of ind. letters to iterate over
  - split string into an array of chars using #chars
- check if char is a letter
  - iterate over the array
  - downcase the letter to account for uppercased letters
  - if char is included in letters array, replace it with it's position in alpha.
    - retrieve its index from array and add 1 to it
  - if it's not included in the array, skip the iteration
- return the new string of numbers
  - convert the array into a string and seperate each char by a space
=end

def alphabet_position(string)
  alphabet = ('a'..'z').to_a
  result = []

  string.each_char do |char|
    char = char.downcase
    if alphabet.include?(char)
      result << alphabet.index(char) + 1
    end
  end
  result.join(' ')
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"

=begin

Problem 10: Simple Simple Simple String Expansion

Given a string that includes alphanumeric characters ('3a4B2d') return the expansion of that string: The numeric values represent the occurrence of each letter preceding that numeric value. There should be no numeric characters in the final string. Empty strings should return an empty string.
The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears.

input: string
output: new string
rules: 
- no numeric chars in final string
- return empty str if the str is empty
- return the value of the original str if no numeric chars in str
- preserve the case of the letters
- skip consecutive integers in string until one is reached w/ letter after it
- preserve order of letters in original string
problem: 
- what do I do with the input? 
  - check if the first character is a number
    - if it is, save it to a variable and convert it to integer
    - if char is a letter, print letter 'integer' times
algorithm: 
- create string of all letters in alphabet
- create string of all integers from 1-9
- create a variable for number
- create an empty string
- check if the first character is a number
  - split string into an array of chars and iterate over
  - if it is, save it to a variable and convert it to integer
  - if it isn't and is included in letters string, multiply that
    letter by the integer
- return string
=end

def string_expansion(string)
  letters = ('a'..'z').to_a
  integers = '0123456789'
  number = 1
  str = ""

  string.each_char do |char|
    if integers.include?(char)
      number = char.to_i
    elsif letters.include?(char.downcase)
      str << char * number
    end
  end
  str
end

p string_expansion('3D2a5d2f') # == 'DDDaadddddff'
p string_expansion('3abc') # == 'aaabbbccc'
p string_expansion('3d332f2a')#  == 'dddffaa'
p string_expansion('abcde') # == 'abcde'
p string_expansion('') # == ''

=begin

Problem 11: Mexican Wave

In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.

input: string
output: array of strings
rules: 
- the input string will always be lower case but maybe empty.
- if the character in the string is whitespace then pass over it as if it were an empty seat.
data structure: string, array
example: wave("hello") => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
problem: 
- what do i want to do with the input? 
  - capitalize first letter and lowercase the rest
  - move on to next letter and capitalize it, lowercasing the rest
  - do this for length of string
algorithm:
- create an empty array to hold strings
- split string into an array of chars
- iterate over array of chars using index
- push the first letter capitalized to array
  - add the rest of the letters of string to array
- (second letter) first letter + second letter (capitalized) + last letters
  - index[0..index - 1]: lowercase + index: capitalized + index[ + 1 to -1]: lowercase
  - index[0..index - 1]: lowercase + index: capitalized + index[ + 1 to -1]: lowercase
=end

def wave(string)
  strings = []
  chars = string.downcase.chars

  chars.each_with_index do |letter, index|
    next if letter == " "
    strings << string[0...index] + letter.upcase + string[index + 1..-1] 
  end
  strings
end

def wave(string)
  strings = []

  string.chars.each_with_index do |letter, index|
    next if letter == " "
    string.downcase!
    string[index] = letter.upcase
    strings << "#{string}"
  end
  strings
end

p wave("hello") #== ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

=begin

Problem 12: Sherlock on Pockets

Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something not allowed in his/her pockets.
Allowed items are defined by array of numbers.
Pockets contents are defined by map entries where key is a person and value is one or few things represented by
=end

=begin

Problem 13: BrainF*ck Simple Pig Latin

Time to make a Pig Latin algorithm! But this time write it in brainfuck!
The rules have been dumbed down a bit, so you'll receive no punction marks.
In this version of Pig Latin you just have to move the first symbol to the end, and add 'ay'.
The input guaranteed to be non-empty.

input: string
output: new string
rules: pig latin
- remove first letter, put at end of string
- add 'ay' to end of string
- no punctuation marks
- non-empty string
data structure: array, string
problem: 
- what do I want to do with input? 
  - remove first letter or char of the string
  - put it at the end of the string
  - add 'ay' to it 
algorithm: 
- what do I want to do with input?
  - split string into an array of chars
    - shift off first character of array 
    - insert it at end of array
    - add 'ay' and end
- return array and join it into string
=end

def run_bf(string)
  string = string.chars
  string.insert(-1, string.shift).insert(-1, 'ay').join
end

p run_bf("Pig")
p run_bf('123456789')

=begin

Problem 14: Simple Pig Latin

Move the first letter of each word to the end of it, then add "ay" to the end of the word. Leave punctuation marks untouched.

input: string
output: new string
rules: pig latin
- remove first char and put it at end of string
- add 'ay' to end
- ignore punctuation
examples: 
- pig_it('Pig latin is cool') # igPay atinlay siay oolcay
- pig_it('Hello world !')     # elloHay orldway !
problem: 
- What do I want to do with the input?
  - remove the first character and insert it at end of string
  - then add 'ay' to it
  - if word or letter is equal to !, ?, ;, :, ., skip iteration
algorithm:
- create an empty array
- split string into array of words
- iterate over words
- shift off first char of word and insert it to end of word
- insert 'ay' at the end of string
- if word is equal to or ends with ?, ., !, ;, ;
  - skip the iteration
- return array, join it into string of words seperated by spaces
=end

def pig_it(string)
  words = []
  string.split.each do |word|
    if word == "?" or word == "." or word == "!"
      words << word
    else
      word = word.chars
      words << (word.insert(-1, word.shift).insert(-1, 'ay')).join
    end
  end
  words.join(' ')
end

p pig_it('Pig latin is cool')
p pig_it('Hello World !')


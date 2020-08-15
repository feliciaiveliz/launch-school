=begin

Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.
You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

input: string
output: array of strings
rules: 
- array will contain every word from string
- append a space (' ') and the word length
- words are seperate by one space
- a substring of non-space chars is a word
examples: 
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []
data structure: array, string
algorithm: 
- define word_lengths method with 'string' passed in as parameter
- split string into array of words and save to variable 'words'
- create empty array called lengths = []
- iterate over 'words' array and add each word + " "
- add each word size- << word.size
- return lengths array
=end

def word_lengths(string)
  return [] if string.empty?

  lengths = []
  string.split.each do |word|
    lengths << word + " " + word.size.to_s 4 
  end

  lengths
end

# I can use map because it'll return an array

def word_lengths(string)
  string.split.map do |word|
    word + " " + word.size.to_s
  end

  lengths
end

# or using string interpolation

def word_lengths(string)
  string.split.map {|word| "#{word} #{word.length}"}
end


p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
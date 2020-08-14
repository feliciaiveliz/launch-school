# Problem 1: 

# https://www.codewars.com/kata/52b305bec65ea40fe90007a7/train/ruby

# Pirates have notorious difficulty with enunciating. They tend to blur all the
# letters together and scream at people.

# At long last, we need a way to unscramble what these pirates are saying.

# Write a function that will accept a jumble of letters as well as a dictionary,
# and output a list of words that the pirate might have meant.

# For example:

# grabscrab("ortsp", ["sport", "parrot", "ports", "matey", "portss"]) ==
# ["sport", "ports"]

# Return matches in the same order as in the dictionary. Return an empty array
# if there are no matches.

=begin

input: string, array of string
output: empty array or array of matched strings
rules: 
- matches must be in same order as dictionary
problem: 
- what do i want to do with the input?
- if each letter occurr. is equal for both words, it's a match
- if letter occur. in dictionary word > input string, no match
- if letter occur. in dict. word < input string, no match
algorithm: 
- init words_array 
- split input into array of chars, save to variable
- iterate over dictionary: 1st loop
  - pass each word to the block
    - split word into chars
    
    iterate over word chars: 2nd loop
    - invoke count on input word, pass in first letter, check if equal to dict. word
    - if all letters return true, push word into new array
    - if no match, break out of 2nd loop and go to next word
- return new array 
=end

def grabscrab(string, dictionary)  
  dictionary.select do |word|    
    word.chars.all? { |letter| word.count(letter) == string.count(letter) }
  end
end

p grabscrab("ortsp", ["sport", "parrot", "ports", "matey", "portss"]) == ["sport", "ports"]
p grabscrab("ainstuomn", ["mountains", "hills", "mesa"]) == ["mountains"]
p grabscrab("oolp", ["donkey", "pool", "horse", "loop", "lop"]) == ["pool", "loop"]
p grabscrab("ourf", ["one","two","three"]) == []

def grabscrab(str, arr)
  return_array = []
  count_hash = {}
  str.each_char do |char|
    next if count_hash.has_key?(char)
    count_hash[char] = str.count(char)
  end
  word_count_hash = {}
  arr.each do |word|
    word.each_char do |char|
    next if word_count_hash.has_key?(char)
    word_count_hash[char] = word.count(char)
    end
    if count_hash == word_count_hash
      return_array << word
    else
      word_count_hash.clear
    end
  end
  return_array
end

codewars solution:
def grabscrab(anagram, dictionary)
  dictionary.select { |word| word.chars.sort == anagram.chars.sort }
end
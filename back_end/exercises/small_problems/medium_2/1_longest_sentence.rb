=begin

Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). 
Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

input: 
- string (text)

output: 
- string (longest sentence in text)
- integer (number of words in longest sentence)

rules: 
- sentences can end with periods, exclamation points, or question marks
- if a sequence of chars does not end in spaces or sentence-ending chars, it's a word
- print the number of words in the sentence as an integer

data structures: array
=end

# - split text into seperate words
# - iterate over words
# - if the word includes a period, exclamation point, or question mark 
# - slice text from beginning of text or word directly the last sentence
# - pass to new method
# - count number of words in string
# - save to variable
# - return variable


def retrieve_sentence(string)
  words = string.split # array of seperate words
  sentence = [] # init variable to hold sentence

  words.each_with_index do |word, index| # iterate over array of words
    if word.include?('.') || word.include?('?') || word.include?('!')  # checks to see if word includes a period
      sentence << words[0..index] # 
    end
  end
  sentence
end

def longest(string)
  # word_count =  retrieve_sentence(string).count
  first_sentence = 
  sentence = retrieve_sentence(string)
  sentence.flatten
end

p longest("Four score and seven years ago our fathers brought forth on this continent a new nation. Conceived in liberty, and dedicated to the proposition that all men are created equal.")




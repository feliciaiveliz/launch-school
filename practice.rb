# Your task is to sort a given string. Each word in the string will contain a single number. This number is the position the word should have in the result.
#
# Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).
#
# If the input string is empty, return an empty string. The words in the input String will only contain valid consecutive numbers.

=begin
input: string of words that contain a number
output: string of words that are sorted based on the number
problem:
- each word contains a single digit
- the string should start with the word that contains number 1
- split string into seperate words and sort by:
  - search for the number contained in the word and use that to sort
- return the sorted string
algorithm:
- split string and sort using #split and #sort_by, for each 'word':
  - use #scan to find the digit and this is what will be used by #sort_by to sort the string
- return new string of sorted words
=end

def sort_string(string)
  string.split.sort_by do |word|
    word.scan(/['0-9']/)
  end.join(' ')
end

p sort_string("is2 Thi1s T4est 3a") #== "Thi1s is2 3a T4est"
p sort_string("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
p sort_string("") == ""
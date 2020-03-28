# Notes:

# Work on algorithm. Think through problem thoroughly before writing code.

# # # # Your task is to sort a given string. Each word in the string will contain a single number. This number is the position the word should have in the result.

# Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).

# If the input string is empty, return an empty string. The words in the input String will only contain valid consecutive numbers.


=begin

input: string
output: new string with words sorted
question: what should be done with input?
- iterate over the string, sort string based on number in word
- how?:
  - find number in each word
  - sort words based on number
ALGORITHM:
- 
=end

def order(string)
  string.split.sort_by do |word|
    word.chars.select do |letter|
      letter.to_i != 0
    end
  end.join(' ')
end  

p order("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
p order("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
p order("") == ""


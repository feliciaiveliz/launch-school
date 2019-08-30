=begin

Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

input: string
output: string
rules: 
- non-alphabetic characters should be replaced with one space
- '---' sub with '-'
data structure: array
algorithm: 
- create cleanup(string) method
- save to clean_string splitting string into array
- iterate over array 
- check if word includes? ([^a-zA-Z])
- if it does, replace it with " "
- end method
=end 

# First Attempt
# def cleanup(string)
#   clean_string = string.split.each do |word|
#     if word.include?([^a-zA-Z])
#       word.gsub!(/([^a-zA-Z])/, ' ')
#     end
#   clean_string
# end

# LS
def cleanup(string)
  string.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

p cleanup("---what's my +*& line?")

# Further Exploration
ALPHABET = ('a'..'z').to_a

def cleanup(string)
  clean_chars = []

  string.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end
  clean_chars.join
end

p cleanup("---what's my +*& line?")



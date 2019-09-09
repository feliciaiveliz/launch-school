=begin

Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

input: string
output: new_string
rules: 
- consonants are all chars except vowels, punctuation, and whitespace
examples: 
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
data structure: array, string
algorithm: 
- define double_consonants(string) method
- initialize consonants variable to array of string consonants
- iterate over each_char
- if the char is included in the consonants array, append char * 2 to results
- else append the char
- return results string 
- end method
=end


def double_consonants(string)
  results = ''
  consonants = %w(b c d f g h j k l m n p q r s t v x w y z)
  
  string.each_char do |char|
    if consonants.include?(char)
      results << char * 2
    else
      results << char
    end
  end
  results
end

p double_consonants('String') 
p double_consonants("Hello-World!")
p double_consonants("July 4th")
p double_consonants('')
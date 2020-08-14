=begin

Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

input: string
output: new string
rules: 
- new string contains original value of argument
- first character of every word capitalized
- if letter is already capitalized, it will be downcased
examples: 
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
algorithm: 
- define word_cap(string) method
- split string into array of words
- iterate over array of words, calling capitalize on word
- end method
- return new string.join(' ')
=end

# def word_cap(string)
#   string.split.map { |word| word.capitalize}.join(' ')
# end

# or

# def word_cap(string)
#   string.split.map(&:capitalize).join(' ')
# end

def word_cap(string)
  string.split.map { |word| word[0].upcase + word[1..-1].downcase}.join(' ')
end

p word_cap('four score and seven') 
p word_cap('the javaScript language') 
p word_cap('this is a "quoted" word') 
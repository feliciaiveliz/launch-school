=begin
Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

input: string
output: string
rules: 
- return new string
- collapse all consecutive duplicate characters into single character
- do not use String#squeeze or String#squeeze! 
- if string empty, return empty string
examples: 
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
data structure: array
algorithm: 
- define crunch(string) method
- initialize empty string- words = ''
- split string into array of chars and iterate
- string.chars.each {|char|}
- append each character to the string if the char is not already in it
- return string
=end

def crunch(string)
  single_text = ''
  string.chars.each do |char|
    single_text << char unless char == single_text[-1]
  end
  single_text
end



p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
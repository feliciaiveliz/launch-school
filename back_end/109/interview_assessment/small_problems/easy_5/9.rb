=begin

Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

input: string
output: a new string
rules: 
- only 1 instance of letter can be in the string
- cannot use String#squeeze(!)
data structure: array, string
pseudo-code: 
- define crunch method and pass in 'string' as parameter
- create an empty array
- split string into array of chars. and iterate
- push each character to the array
- if the array already includes that letter, skip it
- if it doesn't, add it
- convert array into string
algorithm: 
- init. empty array called crunched_string
- split string into array using #chars 
- iterate using each
- add each char into array using #<< 
  - if array includes "char" then skip
  - else add word to array
- return array
  - convert to string using join(' ')
=end

def crunch(string)
  crunched_string = []
  string.each_char do |char|
    if crunched_string.last == char
      next
    else
      crunched_string << char
    end
  end
  crunched_string.join
end

# or

def crunch(string)
  crunched_str = []
  string.each_char do |char|
    crunched_str << char unless crunched_str.last == char
  end
  crunched_str.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
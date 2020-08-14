=begin

Pay attention to test cases. Read all of them carefully.
Given the string of chars a..z A..Z do as in the sample cases

p accum("abcd") == "A-Bb-Ccc-Dddd"
p accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
p accum("cwAt") == "C-Ww-Aaa-Tttt"

input: string
output: new string ** ask for clarification
rules:
- each str seq. starts with cap. letter, rest are lowercase
- letter will printed 'n' times- position in string
- each seq. of letters will be seperated by a "-"
data structures: string, arrays
problem:
- start with the first letter, find out it's position
  - if 1, print 1 time, capital letter
  - if 2, print 2 times, cap. letter, then lowercase
  - continue in this pattern
algorithm:
- create an empty array, new string
- split string into an array of chars
- iterate with index: 
  - push to the new array: 
    - current char * its index + 1 
    - capitalize str sequence
- join array into string, seperate with "-"
=end

def accum(string)
  new_string = []

  string.chars.each_with_index do |char, index|
    new_string << (char * (index + 1)).capitalize
  end
  new_string.join("-")
end

p accum("abcd") == "A-Bb-Ccc-Dddd"
p accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
p accum("cwAt") == "C-Ww-Aaa-Tttt"

###########################################################
=begin

Have the method letter_changes(str) take the str parameter being passed and
modify it using the following algorithm. Replace every letter in the string
with the 3rd letter following it in the alphabet (ie. c becomes f, Z becomes C).
Then return this modified string.

input: string
output: new string
rules: 
- replace letter w/ 3rd following letter
- case sensitive
- ignore punct./digits
- if at end of alphabet, wrap around to beginning
data structure: strings, arrays
problem: 
- map letters to positions in alphabet
- check if current char. is a letter
  - if so, find the 3rd following letter, replace current char
  - if not, add current char to string
  - if +3 rule results in end of alpha., reset to start
algorithm:
- create a new string
- create two arrays: lower/uppercase letters
- split string into array of chars
- iterate: 
  - if char is included in lower array
    - assign to 'index' the idx of 3rd letter
    - take index mod 26
    - reference the char at 'index'
    - push result to new string
  - if char is included in lower array
    - assign to 'index' the idx of 3rd letter
    - take index mod 26
    - reference the char at 'index'
    - push result to new string
  - else push char to new string
- return new string
=end

def letter_changes(string)
  upper = ('A'..'Z').to_a
  lower = ('a'..'z').to_a
  new_string = ""

  string.each_char do |char|
    if upper.include?(char)
      index = (upper.index(char) + 3) % 26
      new_string << upper[index]
    elsif lower.include?(char)
      index = (lower.index(char) + 3) % 26
      new_string << lower[index]
    else
      new_string << char
    end
  end
  new_string
end

p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')

##########################################################
=begin

Given a string, replace every letter with its position in the alphabet.
If anything in the text isn't a letter, ignore it and don't return it.
"a" = 1, "b" = 2, etc.

p alphabet_position("The sunset sets at twelve o' clock.") #== "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"

input: string
output: new string
rules:
- ignore punct./digits
- replace letter with position in alpha.
question: 
- account for letter casing?
data structure: array, string
problem: 
- map each letter to its position, a => 1, b => 2, etc.
- check current char, if letter, replace with position
- if not letter, skip iteration
algorithm: 
- create an array of letters a to z
- create new array
- split string into array of chars
- iterate: 
  - downcase the letter
  - skip iteration if char is not a letter
  - else: grab index of current char + 1
  - push result to new array
- join array into string, seperated by spaces
- return string
=end

def alphabet_position(string)
  letters = ('a'..'z').to_a
  new_string = []

  string.each_char do |char|
    char = char.downcase
    next if !letters.include?(char)
    new_string << (letters.index(char) + 1)
  end
  new_string.join(" ")
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"

##########################################################

# Write method scramble(str1,str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.

# For example:
# str1 is 'rkqodlw' and str2 is 'world' the output should return true.
# str1 is 'cedewaraaossoqqyt' and str2 is 'codewars' should return true.
# str1 is 'katas' and str2 is 'steak' should return false.

# Only lower case letters will be used (a-z). No punctuation or digits will be included.
=begin

input: string
output: boolean
rules: 
- return true if str1 can be rearranged to match str2
data structure: string
problem: 
- if there's letter in str2 that's not in str1, false
- if there's > 2 of a letter in str2, but not in str1, false
algorithm: 
- return false if letter count in str2 is > than str1
- return true otherwise
=end

def scramble(str1, str2)
  str2.each_char do |letter|
    return false if str2.count(letter) > str1.count(letter)
  end
true
end

p scramble('javaass', 'jjss')   == false
p scramble('rkqodlw','world')  == true
p scramble('cedewaraaossoqqyt','codewars')  == true
p scramble('katas','steak')  == false
p scramble('scriptjava','javascript')  == true
p scramble('scriptingjava','javascript')  == true

##########################################################
=begin

Given an array of integers, Find the minimum sum which is obtained from summing each Two integers product.

Notes:
- Array/list will contain positives only
- Array/list will always has even size
input: array of integers, or empty array
output: integer, minimum sum or products
data structures: integers, array
Problem: 
- What's the input given? array of integers, or an empty array
- What are you going to do with the input? 
  - sort the array from smallest to largest numbers
  - take two integers- smallest * largest 
  - do this for length of array
  - return sum
  - What are you going to return? integer, minimum sum
algorithm:
- create a variable sum, set to 0
- sort array
- iterate: 
  - until array is empty, 
    - multiply first, last integers
    - increment sum by this product
- return sum
=end

def min_sum(array)
  sum = 0
  array.sort!

  until array.empty? 
    sum += array.shift * array.pop
  end
  sum
end

p min_sum([5,4,2,3]) == 22 # 5*2 + 3*4 = 22 
p min_sum([12,6,10,26,3,24]) == 342 # 26*3 + 24*6 + 12*10 = 342
p min_sum([9,2,8,7,5,4,0,6]) == 74 # 9*0 + 8*2 +7*4 +6*5 = 74
p min_sum([1,2]) == 2
p min_sum([]) == 0

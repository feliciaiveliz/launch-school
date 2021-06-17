=begin
Have the method letter_changes(str) take the str parameter being passed and
modify it using the following algorithm. Replace every letter in the string
with the 3rd letter following it in the alphabet (ie. c becomes f, Z becomes C).
Then return this modified string.
=end

p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')

=begin
Write a method that takes in a number and returns a string, placing
a dash in between odd digits.
=end

p dasherizer(2112) == '21-12'
p dasherizer(201105742) == '201-105-742'
p dasherizer(123456789) == '123456789'
p dasherizer(21121) == '21-121'

=begin
Given a string of words, you need to find the highest scoring word.
Each letter of a word scores points according to it's position in the alphabet:
a = 1, b = 2, c = 3 etc.
You need to return the highest scoring word as a string.
If two words score the same, return the word that appears earliest in the original string.
All letters will be lowercase and all inputs will be valid.
=end

p alphabet_score('man i need a taxi up to ubud') == 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'

###################################

# You've just discovered a square (NxN) field and you notice a warning sign. The sign states that there's a single bomb in the 2D grid-like field in front of you.

# Write a function mineLocation/MineLocation that accepts a 2D array, and returns the location of the mine. The mine is represented as the integer 1 in the 2D array. Areas in the 2D array that are not the mine will be represented as 0s.

# The location returned should be an array (Tuple<int, int> in C#) where the first element is the row index, and the second element is the column index of the bomb location (both should be 0 based). All 2D arrays passed into your function will be square (NxN), and there will only be one mine in the array.

p mine_location( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mine_location( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mine_location( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]

#########################################

# Pay attention to test cases. Read all of them carefully.
# Given the string of chars a..z A..Z do as in the sample cases

p accum("abcd") == "A-Bb-Ccc-Dddd"
p accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
p accum("cwAt") == "C-Ww-Aaa-Tttt"

##############################

# # You are given an array which contains only integers (positive and negative). Your job is to sum only the numbers that are the same and consecutive. The result should be one array.

# # You can asume there is never an empty array and there will always be an integer.

def sum_consecutives(array)
  result = []
  current = nil
  array.each do |number|
    if number == current
      result[-1] += number
    else
      current = number
      result << current
    end
  end
  result
end

p sum_consecutives([1,4,4,4,0,4,3,3,1]) == [1, 12, 0, 4, 6, 1]
p sum_consecutives([1,1,7,7,3]) == [2, 14, 3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]

###############################################################

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

########################################################################################

# Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.
#
# Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,
#
# solve(["abode","ABc","xyzD"]) = [4, 3, 1]
# See test cases for more examples.
#
# Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

solve(["abode","ABc","xyzD"]) == [4, 3, 1]
solve(["abide","ABc","xyz"]) == [4, 3, 0]
solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6, 5, 7]
solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

########################################################################################

# Write a function that takes a single string (word) as argument. The function must return an ordered list containing the indexes of all capital letters in the string.

console.log(capitals('CodEWaRs')) == [0,3,4,6]

#######################################################################################

# Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, which is the number of times you must multiply the digits in num until you reach a single digit.

persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
                # and 4 has only one digit

persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
                 # 1*2*6=12, and finally 1*2=2

persistence(4) # returns 0, because 4 is already a one-digit number

puts persistence(39) == 3
puts persistence(4) == 0
puts persistence(25) == 2
puts persistence(999) == 4
puts persistence(444) == 3

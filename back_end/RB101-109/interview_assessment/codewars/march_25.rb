# Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.
# For n = 152, the output should be 52;
# For n = 1001, the output should be 101.

=begin

input: integer
output: integer, maximal number obtained from deleting one digit from number
problem:
- put number into an array of digits
  - delete the smallest number of array
  - convert the array back to integer
ALGORITHM:
- initialize 'numbers' to []
- use #to_s, #chars, #each_with_index to iterate:
  - use index: 
    - assign 'array' to 'n' #to_s #chars
    - use #delete_at (index)
    - push array #join #to_i to 'numbers'
- call #max to grab highest number
=end

def delete_digit(n)
  result = []
  
  n.digits.reverse.each_index do |index|
    array = n.digits.reverse
    array.delete_at(index)
    result << array.join.to_i
  end
  result.max
end

p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1

# In this kata you are required to, given a string, replace every letter with its position in the alphabet.

# If anything in the text isn't a letter, ignore it and don't return it.


# "a" = 1, "b" = 2, etc.

# Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)

=begin

input: string of words and punct.
output: new string of integers, where integer is letter position in alphabet
problem:
- map letter to positions in alphabet
- iterate over string, given a char:
  - if char is a letter, replace with position
- return string
ALGORITM:
- initialize 'alphabet' to 'a'..'z' #to_a
- initialize 'result' to []
- split string using #each_char
  - downcase character
  - if character is included in alphabet
    - use #index to grab letter's position + 1
      - push this number to string
- return string, call #join(' ')
=end

def alphabet_position(string)
  alphabet = ('a'..'z').to_a
  result = []
  
  string.each_char do |char|
    char = char.downcase
    if alphabet.include?(char)
      result << alphabet.index(char) + 1
    end
  end
  result.join(' ')
end

def alphabet_position(text)
  alphabet = ('a'..'z').to_a
  text.delete!('^a-zA-Z')
  text.chars.map { |letter| (alphabet.index(letter.downcase) + 1) }.join(' ')
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"

# Simple Pig Latin | 6 kyu

# Move the first letter of each word to the end of it, then add "ay" to the end of the word. Leave punctuation marks untouched.

=begin

input: string of words and punct.
output: string of words and punct.: add first letter to end of word + ay
problem:
- iterate over string, given word
  - remove first letter and add to end
  - add 'ay'
  - add punct. as is, without adding 'ay'
ALGORITHM:
- initialize 'result' to []
- split string using #split, given word
  - IF word is not 'letters'
    - result << word
  - ELSE 
    - split word using #chars:
      - use word.insert(-1, word.chars.shift) + 'ay'
      - push the whole word to 'result'
- return join
=end

def pig_it(string)
  punct = %w(? ! . , ' ")
  result = []
  string = string.split
  string.each do |word|
    if punct.include?(word)
      result << word
    else
     word = word.chars
     word.insert(-1, word.shift) << 'ay'
     result << word.join
    end
  end
  result.join(' ')
end

p pig_it('Pig latin is cool') # igPay atinlay siay oolcay
p pig_it('Hello world !')     # elloHay orldway !

# Given a number n, return the number of positive odd numbers below n, EASY!

=begin

input: integer
output: array of odd numbers below 'n'
problem:
- create a range from 1 to (one less than) 'n'
- use #count to grab odd numbers
- return array of odd numbers
ALGORITHM:
- create range: (1...number)
- #count: if number is odd, choose number
- return array
=end

def odd_count(number)
  (1...number).count { |n| n.odd? }
end

p odd_count(7) == 3 #i.e [1, 3, 5]
p odd_count(15) == 7 #i.e [1, 3, 5, 7, 9, 11, 13]

# The year of 2013 is the first year after the old 1987 with only distinct digits.

# Now your task is to solve the following problem: given a year number, find the minimum year number which is strictly larger than the given one and has only distinct digits.

# Input/Output
# [input] integer year

# 1000 ≤ year ≤ 9000

# [output] an integer

# the minimum year number that is strictly larger than the input number year and all its digits are distinct.

=begin

input: integer year
output: integer year with distinct year
problem:
- increment 'year' by 1 until
  - year.digits.uniq is equal to year.digits
- if the year numbers are uniq then return the year
=end

def distinct_digit_year(year)
  loop do 
    year += 1
    break if year.digits == year.digits.uniq
  end
  year
end
  
p distinct_digit_year(1987) #== 2013
p distinct_digit_year(2013) #== 2014
p distinct_digit_year(2229) #== 2301

# Given an array of integers, Find the minimum sum which is obtained from summing each Two integers product.

# Array/list will contain positives only.
# Array/list will always has even size.
  
=begin

input: array of integers
output: integer, minimum sum
problem:
- sort array from smallest to largest number
- remove first and last numbers from arry until its empty
  - multiply each two numbers and add to array
  - sum the products
ALGORITHM:
- initilaize 'result' to []
- sort the array using #sort!
- until array is empty:
  - use #shift and #pop and multiply them
  - add the result to 'result'
- sum the result array
=end

def min_sum(array)
  result = []
  array.sort!
  
  until array.empty?
    result << array.shift * array.pop
  end
  result.sum
end
p min_sum([5,4,2,3]) == 22
p min_sum([12,6,10,26,3,24]) == 342



# Given a number, return the maximum number that could be formed from the digits of the number given.

# Only Natural numbers passed to the function , numbers Contain digits [0:9] inclusive.

# Digit Duplications could occur , So also consider it when forming the Largest

=begin

input: integer
output: maxixum integer
proble:
- sort number from largest to smallest
- return the number
ALGORITM:
- use #digits and #sort to get array of largest to smallest digits
- use #join and #to_i to convert back to integer
=end

def max_number(number)
  number.digits.sort.reverse.join.to_i
end
p max_number(213) == 321
p max_number(7389) == 9873
p max_number(63792) == 97632

# Create a function named divisors/Divisors that takes an integer n > 1 and returns an array with all of the integer's divisors(except for 1 and the number itself), from smallest to largest. If the number is prime return the string '(integer) is prime'.

=begin

input: integer
output: array of divisors of integer, or string "N is prime"
problem:
- create a range from 2 to (one less than) number
- iterate and select numbers that are evenly divided into number
- return array
- if the array is empty, return 'number is prime'
ALGORITHM:
- create range from 2...number 
- initialize 'result' to:
  - use #select and iterate with 'n'
    - select n if number mod n is == to 0
- return string if array is empty?
=end

def divisors(number)
  result = (2...number).select { |n| number % n == 0 }
  result.empty? ? "#{number} is prime" : result
end

p divisors(12) # should return [2,3,4,6]
p divisors(25) # should return [5]
p divisors(13) # should return "13 is prime"

# Complete the solution so that the function will break up camel casing, using a space between words.
  
=begin
input: string
output: string, w/ space in front of capital letter
problem:
- iterate through string and add leters to a new string
- if current letter is capital, add " " first, then current letter
- return string
ALGOIRTHM:
- initialize 'rsult' to ""
- split string using #chars and iterate:
- add letter to string if string if lowercase
- add " " then letter if uppercase
- return string
=end

def solution(string)
  result = ""
  
  string.each_char do |char|
    if char == char.upcase
      result << " " << char
    else
      result << char
    end
  end
  result
end

p solution("camelCasing")  #==  "camel Casing"

# The goal of this exercise is to convert a string to a new string where each character in the new string is "(" if that character appears only once in the original string, or ")" if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.

# "din"      =>  "((("
# "recede"   =>  "()()()"
# "Success"  =>  ")())())"
# "(( @"     =>  "))((" 

=begin
input: string
output: string, if char count is 1, "(", if char count is > 1, ")"
problem:
- initilaize 'result' to ""
- downcase string using #downcase!
- split string using #each_char, given char
  - IF string count of char is == 1
    - add "(" to result
  - ELSE 
    - ")" to result
  - END
- return result
=end

def duplicate_encode(string)
  string.downcase!
  result = ""
  string.each_char do |char|
    if string.count(char) == 1
      result << "("
    else
      result << ")"
    end
  end
  result
end

def duplicate_encode(string)
  string.downcase!
  string.chars.map { |char| string.count(char) > 1 ? ")" : "(" }.join
end

p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("

# Given a non-negative number, return the next bigger polydivisible number, or an empty value like null or Nothing.

# A number is polydivisible if its first digit is cleanly divisible by 1, its first two digits by 2, its first three by 3, and so on. There are finitely many polydivisible numbers.

=begin

input: integer
output: polydivisible integer
problem:
- create a loop:
  - increment number by 1
  - find size of number, use it to find divisibles, save to 'size'
    - create an index to keep track of what number were checking
example:
- 11
- size of 11 is 2: save as size
- start_index to 0
- put 11 in array, digits reverse
- array.to_s[0, 1].to_i % 1 == 0, check next numbers
- array.to_s[0, 2].to_i % 2
- array.to_s[0, 3].to_i % 3
=end

def next_sum(number)
  start_index = 0
  start_size = 0
  divisibility = 1
  
  loop do 
    number += 1
    size = number.to_s.size
    array = number.digits.reverse
  
    if array.to_s[start_index, start_size].to_i % divisibility == 0
        start_index += 1
        start_size += 1
        divisibility += 1
    else
      
end

next_num(0) == 1
next_num(10) == 12
next_num(11) == 12
next_num(1234) == 1236
next_num(123220) == 123252
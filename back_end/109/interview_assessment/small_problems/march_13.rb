# Easy 6

# Problem 1: Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

=begin

input: array of string(s)
output: a new array of strings(s)
problem: 
- what do i want to do with the input?
  - delete all lowercase and uppercase vowels
algorithm:
- use #each to iterate
- use #delete! and pass in lowercase and uppercase vowels as argument string
=end

# def remove_vowels(array)
#   array.each { |word| word.delete!('aeiouAEIOU') }
# end

# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Problem 2: Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.
# You may not use Array#reverse or Array#reverse!.

=begin

input: array
output: same array, reversed
problem: 
- what do i want to do with input? 
  - for the length of the array: 
    - remove the last element 
    - insert it starting from 0th place, up to size of array
algorithm: 
- use #size and #times to iterate over array
- pass 'n' to the block: this variable keeps track index of insertion of element
- use #insert and #pop to put last element at 'n' position
- return array
=end

# def reverse!(list)
#   list.size.times do |n|
#     list.insert(n, list.pop)
#   end
#   list
# end

# list = [1,2,3,4]
# result = reverse!(list)
# p result == [4, 3, 2, 1]
# p list == [4, 3, 2, 1]
# p list.object_id == result.object_id

# list = %w(a b e d c)
# p reverse!(list) == ["c", "d", "e", "b", "a"]
# p list == ["c", "d", "e", "b", "a"]

# list = ['abc']
# p reverse!(list) == ["abc"]
# p list == ["abc"]

# list = []
# p reverse!(list) == []
# p list == []

# Problem 3: Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

=begin

input: array of integers, or empty array
output: a pair of nested Arrays
problem: 
- what do i want to do with the input? 
  - find size of the array: 
    - if it's odd, find the middle number: 
      - take array size, convert to float, divide by 2 and raise up to next
        largest integer
    - use that number to put the middle number in the first array
  - if array size is even:
    - divide the array in half and put each piece into the new array
algorithm: 
- intialize first_half, second_half variables, set to empty array
- use #size to get array size, use #even?: 
  - if even:
    - divide array size by 2, save to variable 'middle'
    - use #slice! to get an array of 'middle' elemnents, save to 'first_half'
    - put the remaining elements in second half
    - put both arrays in a larger array
  - if odd:
    - init. middle variable, set to 0
    - convert array size to float, divide by 2 and use #ceil to round up, save to 'middle'
    - use #slice! to get an array of 'middle' elemnents, save to 'first_half'
    - put the remaining elements in second half
    - put both arrays in a larger array
=end

# def halvsies(array)
#   if array.size.even?
#     middle = array.size / 2
#     first_half = array.slice!(0, middle)
#     second_half = array
#   else
#     middle = (array.size.to_f / 2).ceil
#     first_half = array.slice!(0, middle)
#     second_half = array
#   end
#   [first_half, second_half]
# end

# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

=begin

input: string
output: hash
problem: 
- what do i want to do with input? 
  - iterate over string
  - count lowercase, uppercase and neither letters
  - update my hash table per iteration
algoritm: 
- intialize hash 'count', create keys for lowercase, uppercase, neither, set all to 0
- initialize lower range 'a' to 'z'
- inititlze upper range 'A' to 'Z'
- split the string into array of chars
- iterate: 
  - if letter is included in LOWER range
    - create key 'lowercase' and increment by 1
  - if letter is incdluded in UPPER range
    - create key 'uppercase' key and increment by 1
  - if included in neither
    - create 'neither' key and increment by 1
- return hash
=end

# def letter_case_count(string)
#   counts = { lowercase: 0, uppercase: 0, neither: 0 }

#   lower = ('a'..'z').to_a
#   upper = ('A'..'Z').to_a

#   string.each_char do |letter|
#     if lower.include?(letter)
#       counts[:lowercase] += 1
#     elsif upper.include?(letter)
#       counts[:uppercase] += 1
#     else
#       counts[:neither] += 1
#     end
#   end
#   counts
# end

# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.
# You may assume that words are any sequence of non-blank characters.

=begin

input: string
output: new string, all words capitalized
problem: 
- what do i want to do with the input?
  - iterate over each word, capitalize it
  - return the new string
algorithm: 
- split string into an array of words
- use #map to iterate and return new array:
  - invoke #capitalize on each word
- convert the array into a string
- return string
=end

# def word_cap(string)
#   string.split.map { |word| word.capitalize }.join(' ')
# end

# def word_cap(string)
#   string.split.map do |word|
#     word[0].upcase + word[1..-1].downcase
#   end.join(' ')
# end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.
# You may not use String#swapcase; write your own version of this method.

=begin

input: string
output: a new string, letter case swapped
problem: 
- what do i want to do with input?
  - iterate over the string: 
    - if letter is uppercase, change it to lowercase
    - if letter is lowercase, change it to uppercase
    - if neither, keep letter the same
algorithm: 
- initialize range of lower letters: 'a' to 'z'
- initialize range of upper letters: 'A' to 'Z'
- initialize empty string swapped = ""
- split the string into array of chars
- iterate: 
  - if letter is included in upper range
    - #downcase letter and add to string
  - if incldued in lower range
    - #upcase letter and add to string
  - if neither
    - add letter to string
- return the string
=end

# def swapcase(string)
#   lower = ('a'..'z').to_a
#   upper = ('A'..'Z').to_a
#   swapped = ""

#   string.each_char do |letter|
#     if lower.include?(letter)
#       swapped << letter.upcase
#     elsif upper.include?(letter)
#       swapped << letter.downcase
#     else
#       swapped << letter
#     end
#   end
#   swapped
# end

# p swapcase('CamelCase') #== 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

=begin

input: string
output: new string with staggered letter casing
problem: 
- what do i want to do with the input? 
  - downcase all characters
  - capitalize all in even positions
algoritm: 
- use #downcase on string
- split string into array of chars using #chars
- iterate using #map and #with_index
- use #upcase on letter if the index is even
- return the string by converting the array using #join
=end

# def staggered_case(string)
#   string.downcase!
#   string.chars.map.with_index do |char, idx|
#     idx.even? ? char.upcase : char
#   end.join
# end

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

=begin

input: string
output: a new string with staggered letter case
problem: 
- skip iterations for chars that are letters
- if it is letter and in an even position, upcase letter
algoritm: 
- create ranges for lowercase and uppercase letters
- use #downcase for string
- inititalize empty array 
- iterate using #each_with_index
- if char is not included in either lower or upper range: 
  - add to string
=end

# def staggered_case(string)
#   lower = ('a'..'z').to_a
#   upper = ('A'..'Z').to_a
#   string.downcase!

#   new_string = ""
#   string.chars.each_with_index do |char, idx|
#     if !lower.include?(char) && !upper.include?(char)
#       new_string << char 
#     else
#       if idx.even? 
#         new_string << char.upcase
#       else
#         new_string << char
#       end
#     end
#   end
#   new_string
# end

# p staggered_case('I Love Launch School!') #== 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

=begin

input: array of integers
output: string that outputs math. result
problem:
- multiply all numbers in array together
- divide result by array size
- format result to 3 decimal places
algoritm: 
- use #inject and pass * as argument
- divide quotient by array size
- use #format to get decimal places
=end

# def show_multiplicative_average(array)
#   average = ((array.inject(:*) / array.size.to_f))
#   puts "The result is #{format('%.3f', average)}"
# end

# p show_multiplicative_average([3, 5])
# #The result is 7.500

# p show_multiplicative_average([6])
# #The result is 6.000

# p show_multiplicative_average([2, 5, 7, 11, 13, 17])
# #The result is 28361.667

# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that hav

=begin

input: two arrays
output: one array
problem: 
- multiply integers with the same index, save the result into an array
algoritm: 
- use #map to iterate over first array with index
- multiply the current number by number in other array
  w/ same index
- return array
=end

# def multiply_list(a, b)
#   a.map.with_index { |n, idx| n * b[idx] }
# end
# 
# p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

=begin

Given a lowercase string that has alphabetic characters only and no spaces, return the highest value of consonant substrings. Consonants are any letters of the alphabet except "aeiou".

We shall assign the following values: a = 1, b = 2, c = 3, .... z = 26.

For example, for the word "zodiacs", let's cross out the vowels. We get: "z d cs"

input: string
output: integer, highest consanant value
problem: 
- what do i want to do w/ input?
  - replace vowels with "spaces"
  - slice strings at each space; save substrings
  - find alphabet value. char, or subset of chars
  - find the largest value
algoritm:
- initialize alphabet with their positions
  - hash: key => letter, value => position
- initialize empty array 'substrings' = []
- initialize variable value = 0
- replace all vowels with spaces using #gsub

- find index of space using #index
- slice out first substring using #slice! starting from 0 to 'space'
  - put into 'substings'
- find index of space using #index (for rest of string)
- slice out rest of substrings using #slice! starting from 0 to 'space'
- array of substrings: 
  - iterate using #map and pass each substring into block
  - block: split string into characters
    - set 'value' to increment every letter and it's alphabet value
- array of consonant values: 
  - use #max to find largest
  - return largest number
=end

require 'pry'

LETTERS = ('a'..'z').to_a
POSITIONS = (1..26).to_a
ALPHABET = LETTERS.zip(POSITIONS).to_h

def solve(string)
  substrings = []
  index = 0
  consonant_values = []
  multiple_values = []
  string.gsub!(/[aeiou]/, " ")

  loop do 
    break if string.empty? || string.nil?
    index = string.index(" ")
    substrings << (string.slice!(0..index)).delete(" ")
    substrings.delete("")
  end
  
  substrings.each do |substring|
    substring = substring.chars
    if substring.size > 1
      substring.each do |letter|
        multiple_values << ALPHABET[letter]
      end
      consonant_values << (multiple_values.sum)
      multiple_values.clear
    else
      substring.each do |letter|
        consonant_values << ALPHABET[letter]
      end
    end
  end
  consonant_values.max
end

p solve("zodiac") == 26 
p solve("chruschtschov") == 80
p solve("khrushchev") == 38
p solve("strength") == 57
p solve("catchphrase") == 73
p solve("twelfthstreet") == 103
p solve("mischtschenkoana") == 80
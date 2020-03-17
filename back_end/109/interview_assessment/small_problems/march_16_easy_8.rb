=begin

Problem 1: Sum of Sums => Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

input: arry of integers
output: integer, sum of leading subsequences
problem: 
- add each subsequence for a total sum
  - start with first number
  - last sequence should contain all numbers of array
algorithm:
- initialize 'sum' to 0
- initialize 'sequence' to 0
- iterate: use 'n' for current number
  - assign 'sequence' to 'n', assign to 'sum'
  - repeat process for length of array
- return 'sum'
=end

# def sum_of_sums(array)
#   sum = 0
#   sequence = 0
#   array.each do |n|
#     sequence += n
#     sum += sequence
#   end
#   sum
# end

# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

=begin

Problem 2: Madlibs => Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

input: mulitple strings
output: multiple string
problem: 
- prompt user for noun, verb, adjective, adverb
- create sentence to inject user's responses in
- display sentence to the user
algorithm:
- 4 'puts' statements for each request
- save each response to variables: noun, adverb, adjective, verb
- use final #puts statement to display madlib sentence
=end

# def prompt(msg)
#   puts "#{msg}"
# end

# prompt "Enter a noun: "
# noun = gets.chomp

# prompt "Enter a verb: "
# verb = gets.chomp

# prompt "Enter an adjective: "
# adjective = gets.chomp

# prompt "Enter an adverb: "
# adverb = gets.chomp

# prompt "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"

=begin

Problem 3: Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

input: string
output: array of substrings
problem: 
- create substrings: 
  - first substring => first letter
  - second substring => first + second letter
  - continues for length of string
algorithm: 
- initialize 'substrings' to []
- initialize 'index' to 0
- iterate: use #size #times and 'idx'
- use #slice: start from 'index' to 'idx'
- push substrings to 'substrings' array
=end

# def substrings_at_start(string)
#   substrings = []

#   string.size.times do |n|
#     substrings << string.slice(0..n)
#   end
#   substrings
# end

# p substrings_at_start('abc') == ['a', 'ab', 'abc']
# p substrings_at_start('a') == ['a']
# p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

=begin

Problem 4: Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the substrings_at_start method you wrote in the previous exercise:

input: string
output: array of all substrings
problem: 
- create substrings from first letter to include all letters
- for subsequent starting substrings, start at next letter
- continue for whole string
algoritm: 
- *use preivous method to create substrings
- initialize 'substrings' to []
- iterate (string size) times through string
- use 'n' as starting substring 'index'
- pass in 'string' to 'substrings_at_start' method
  - sequence: index(0) to -1 (end of string)
- increment index by 1, to start substrings at next letter
- continues for length of string
- push each substring set to 'substrings'
- convert to 1D array using #flatten
=end

# def substrings_at_start(string)
#   substrings = []
#   index = 0

#   string.size.times do |n|
#     substrings << string.slice(index..n)
#   end
#   substrings # return value is array
# end

# def substrings(string)
#   # index = 0
#   substrings = []

#   string.size.times do |n|
#     substrings << (substrings_at_start(string[n..-1]))
#   end
#   substrings.flatten
# end

# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

=begin

Problem 5: Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.
You may (and should) use the substrings method you wrote in the previous exercise.
For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

input: string
output: array of palindromic substrings
problem:
- create substrings using #substrings at start
- find all possible substrings using #substrings method
- given all substrings: find palindromes
rules: 
- palindromes are case sensitive
- non-letters are included in palidromic substrings
- single characters are not palindromes
  - substring size must be greater than 1
algorithm: 
- define is_palindrome? method: 
  - palindrome if str compared to str reversed is equal
  - use #reverse
- pass all possible substrings to palindrome method
- select from all palindromes substrings sizes > 1
=end

# def substrings_at_start(string) # returns substrings at a start
#   substrings = []
#   index = 0

#   string.size.times do |n|
#     substrings << string.slice(index..n)
#   end
#   substrings # return value is array
# end

# def substrings(string) # returns all possible substrings
#   # index = 0
#   substrings = []

#   string.size.times do |n|
#     substrings << (substrings_at_start(string[n..-1]))
#   end
#   substrings.flatten
# end

# def is_palindrome?(string) # check if substrings are palindromic
#   string == string.reverse
# end

# def palindromes(string) # returns all palindromic substrings
#   substrings(string).select do |substring| 
#     is_palindrome?(substring) && substring.size > 1
#   end
# end

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

=begin

Problem 6: fizzbuzz => Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

input: two integers, starting and ending numbers
output: string
problem: 
- create a range from 1 up to a target number
- print "Fizz" for % by 3, "Buzz" for % by 5, "FizzBuzz" for % by 3 and 5
algoritm:
- use #map on a range for numbers 1 to 'n'
- if 'n' mod 3 == 0 and 'n' mod 5 == 0, "FizzBuzz"
- if 'n' mod 3 is equal to 0, "Fizz"
- if 'n' mod 5 is equal to 0, "Buzz"
- join to string, seperate by comma and space
=end

# def fizzbuzz(start, last)
#   string = []

#   start.upto(last).each do |n|
#     if n % 3 == 0 && n % 5 == 0
#       string << "FizzBuzz"
#     elsif n % 3 == 0
#       string << "Fizz"
#     elsif n % 5 == 0
#       string << "Buzz"
#     else
#       string << n.to_s
#     end
#   end
#   string.join(', ')
# end

# puts fizzbuzz(1, 15) ==  "1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz"

=begin

Problem 7: Double Char (Part 1) => Write a method that takes a string, and returns a new string in which every character is doubled.

input: string
output: a new string, double every character
problem: 
- given a letter, double it 
algorithm: 
- use #chars and #map to iterate:
  - multiple 'letter' by 2
- return string by using #join
=end

# def repeater(string)
#   string.chars.map { |letter| letter * 2 }.join
# end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''

=begin

Problem 8: Double Char (Part 2) => Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

input: string
output: a new string, consonants doubled
problem: 
- check if character is consonant: 
  - if it is, double letter
  - if it isn't, letter
algoritm: 
- initialize 'consonants' to array of letters
- initialize 'double' to []
- use #each_char to iterate: 
  - if char is included in consonants array, double letter
    - *downcase letter first
    - else, letter is pushed to array as is
- return 'double', use #join to convert to string
=end

# def double_consonants(string)
#   letters = %w(b c d f g h j k l m n p q r s t v w x y z)
#   string.chars.map { |char| letters.include?(char.downcase) ? char * 2 : char }.join
# end

# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants('') == ""

=begin

Problem 9: Convert number to reversed array of digits

Write a method that takes a positive integer as an argument and returns that number with its digits reversed. 

=end

# def reversed_number(number)
#   number.digits.join.to_i
# end

# p reversed_number(12345) == 54321
# p reversed_number(12213) == 31221
# p reversed_number(456) == 654
# p reversed_number(12000) == 21 # No leading zeros in return value!
# p reversed_number(12003) == 30021
# p reversed_number(1) == 1

=begin

Problem 10: Get The Mddle Character

Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

input: non-empty string
output: string, single or double characters
problem: 
- return middle characters: 
  - if str size is even, return 2 chars
  - if str size is odd, return 1 char
- find size of string, divide by 2
- use result to retrieve middle characters
algoritm: 
- initialize 'middle' to using #size on string.
  - convert size to float using #to_f, divide by 2
  - use #ceil to round up to next larget integer
- use character reference and 'middle' to retrive chars
  - if even, use a range from (one less than middle) to middle
  - if odd, use [middle]
=end

# def center_of(string)
#   middle = (string.size / 2)
#   string.size.even? ? string[(middle - 1)..middle] : string[middle]
# end


# p center_of('I love ruby') == 'e'
# p center_of('Launch School') == ' '
# p center_of('Launch') == 'un'
# p center_of('Launchschool') == 'hs'
# p center_of('x') == 'x'
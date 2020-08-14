
# Write a function that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

# Examples:

=begin

input: integer
output: integer, difference between square of sum of first n positive integers
and sum of squares of first positive integers
problem:
- create range from 1 to n
  - find sum of each number and square result
- create range from 1 to n
  - find the squared result of each number, sum all numbers
- find difference between first set of numbers and second set
ALGO:
- initialize 'squared_sums' to 0
- initialize 'summed_squares' to 0
- create range using (1..n) and iterate using #each:
  - increment 'squared_sums' by each number
  - square 'squared_sums'
- create range using (1..n) and iterate using #each:
  - incrmenet 'summed_squares' by each number squared
- squared_sums - summed_sqaures
=end

def sum_square_difference(n)
  squared_sums = 0
  summed_squares = 0
  
  (1..n).each do |number|
    squared_sums += number
    summed_squares += (number ** 2)
  end
  
  squared_sums = squared_sums ** 2
  squared_sums - summed_squares
end

p sum_square_difference(3) ==  22 #--> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

=begin

Write a function that takes a string argument, and returns a list of all substrings that start from the beginning of the string, ordered from shortest to longest.

=end

=begin

input: string
output: array of strings
problem:
- for size of string
  - slice out substrings starting at 0 to idx + 1
- return substrings
ALGO:
- initialize 'substrings' to []
- iterate over string using #size and #times, given 'idx'
  - substrings << slice from 0, idx + 1
- return 'substrings' 
=end

def substrings_at_start(string)
  substrings = []
  
  string.size.times do |idx|
    substrings << string.slice(0, idx + 1)
  end
  
  substrings
end

p substrings_at_start('abc') == ["a", "ab", "abc"]
p substrings_at_start('a') == ["a"]
p substrings_at_start('xyzzy') == ["x", "xy", "xyz", "xyzz", "xyzzy"]

=begin
Write a function that takes a string as an argument, and returns an array that contains every word from the string, with each word followed by a space and the word's length. If the argument is an empty string or if no argument is passed, the function should return an empty array.

You may assume that every pair of words in the string will be separated by a single space.
=end

=begin

input: string of words
output: array of words and their sizes
problem:
- iterate over string, given word:
  - add word to array + space + word size
- return array
ALGO:
- split string using #split, and #map: 
  - string interpolate: word + space + word size
- return array
=end

def word_lengths(string)
  string.split.map { |word| "#{word} #{word.size}" } 
end

p word_lengths('cow sheep chicken') == ["cow 3", "sheep 5", "chicken 7"]
p word_lengths('baseball hot dogs and apple pie') == ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

=begin

Write a program that can tell you what the nth prime is.

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

=end

=begin

input: integer
output: nth prime number
problem:
- create range from 2 to any number:
  - select numbers that are prime
    - any number that cannot be easily divided by another number
- find the prime number in the nth position
ALGO:
- initialize 'primes' to []
- until primes.size == nth (loop)
- 'number_to_check' to 3 
  - range: from 2 to one less than 'number_to_check'
    if number_to_check % number == 0, break 
  - add number_to_check
  - increment 'number_to_check' by 1
- return last number of array
=end

def nth_prime(nth)
  primes = [2]
  number_to_check = 3
  
  until primes.size == nth
    (2...number_to_check).each do |number|
      if number_to_check % number == 0
        break
        number_to_check += 1
      end
    end
    primes << number_to_check
    number_to_check += 1
  end
  primes[-1]
end

p nth_prime(6) == 13
p nth_prime(2) == 3
p nth_prime(4) == 7
p nth_prime(5) == 11
p nth_prime(1) == 2

# Print all the primes between 2 numbers without using the prime class.

# You will always be given two positive integers. One or both of the integers can be zero.

=begin

input: two integers
output: array of primes between the two integers
problem:
- create a range from first number to second number
- for each number:
  - find out if number is prime
- put all primes into an array
- return the arry
ALGO:
- define a method called 'is_prime?':
  - from 2 to (one less than) number
    - false if number mod 'n' == 0
  - true
- select numbers from this method if number is prime
- define primes_between:
  - range from first..second
    - use #select if number passed to 'is_prime' is true
    - and is > 1
- return array
=end

def is_prime?(number)
  (2...number).each do |n|
    return false if number % n == 0
  end
  true
end

def primes_between(first, second)
  (first..second).select do |n|
    is_prime?(n) && n > 1
  end
end

p primes_between(1, 5) == [2, 3, 5]
p primes_between(3, 10) == [3, 5, 7]
p primes_between(3, 7)  == [3, 5, 7]
p primes_between(8, 9)  == []
p primes_between(0, 1) == []


# Given an array of strings made only from lowercase letters, return an array of all characters that show up in all strings within the given array (including duplicates).  For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.
p common_chars(["bella","label","roller"]) == ["e", "l", "l"]
p common_chars(["cool","lock","cook"]) == ["c", "o"]
p common_chars(["hello","goodbye","booya", "random"]) == ["o"]
p common_chars(["aabbaaaa","ccdddddd","eeffee", "ggrrrrr", "yyyzzz"]) == []

# Write method scramble(str1,str2) that returns true if a portion of str1
# characters can be rearranged to match str2, otherwise returns false.
#
# For example:
# str1 is 'rkqodlw' and str2 is 'world' the output should return true.
# str1 is 'cedewaraaossoqqyt' and str2 is 'codewars' should return true.
# str1 is 'katas' and str2 is 'steak' should return false.
#
# Only lower case letters will be used (a-z). No punctuation or digits will be included.

=begin

input: two strings
output: boolean
problem:
- true if count of letters in str2 is < = str1
ALGO:
- iterate using #each_char on str2: given letter
  - return false if str2.count(letter) > str1.count(letter)
- true
=end

def scramble(str1, str2)
  str2.chars.each do |letter|
    return false if str2.count(letter) > str1.count(letter)
  end
  true
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true


# Given an array of strings made only from lowercase letters, return an array of all characters that show up in all strings within the given array (including duplicates).  For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.

=begin

input: array of strings
output: empty array or array of single char strings
problem:
- return an array of letters that show up in all strings at least once
- create hash of first word: key => letter | value => count of letter
- iterate over array, given word:
  - if letter count of 'word' is == to count of letter in hash (second)
    - add to 'result'
  - do this for whole word
- for second word: reassign hash: key => letter | value => count of letter
  - if letter count of 'word' is == to count of letter in hash (second)
    - add to 'result'
    - 
=end

# if all the words include a letter that occurs *at least once* in each word

def common_chars(array)
  word_hash = {}
  first_word = array.shift
  final_result = []
  
  first_word.each_char do |letter| # hash for first word
    word_hash[letter] = first_word.count(letter)
  end
  
  result = word_hash.select do |k, v|
    array.all? do |word|
      word.count(k) > 0
    end
  end
  
  result.each do |k, v|
    v.times do 
      final_result << k
    end
  end
  
  final_result
end

p common_chars(["bella","label","roller"])# == ["e", "l", "l"]
p common_chars(["cool","lock","cook"]) #== ["c", "o"]
p common_chars(["hello","goodbye","booya", "random"]) #== ["o"]
p common_chars(["aabbaaaa","ccdddddd","eeffee", "ggrrrrr", "yyyzzz"]) #== []
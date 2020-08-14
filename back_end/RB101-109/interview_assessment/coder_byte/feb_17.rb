=begin
Have the function FindIntersection(strArr) read the array of strings stored in strArr which will contain 2 elements: the first element will represent a list of comma-separated numbers sorted in ascending order, 
the second element will represent a second list of comma-separated numbers (also sorted). Your goal is to return a comma-separated string containing the numbers that occur in elements of strArr in sorted order. 
If there is no intersection, return the string false. For example: if strArr contains ["1, 3, 4, 7, 13", "1, 2, 4, 13, 15"] the output should return "1,4,13" because those numbers appear in both strings. 
The array given will not be empty, and each string inside the array will be of numbers sorted in ascending order and may contain negative numbers.

input: array of two strings
output: string
rules:
- str will contain elements of both input strings
- string will never be empty
- elements will be in ascending order
- may contain negative numbers
- return "false" (string) if no intersection found
data structure: string, array
problem: 
- What do I want to do w/ the input?
  - put both strings into their own arrays
  - find intersection of array
  - return it as a string
  - if none is found, return "false"
algorithm:
- create variable first, set to empty array
- create variable second, set to empty array
- set first to first element of array
- set second to second element of array
- map over both arrays and delete commas
- assign to intersection first & second and join with a comma (no space)
- return intersection, "false" otherwise
=end

def find_intersection(array)
  first = array[0].split.map! { |n| n.delete(",") }
  second = array[1].split.map! { |n| n.delete(",") }
  intersection = (first & second).join(",")
  return "false" if intersection.empty?
  intersection
end

p find_intersection(["1, 3, 4, 7, 13", "1, 2, 4, 13, 15"])
p find_intersection(["1, 3, 9, 10, 17, 18", "1, 4, 9, 10"])
p find_intersection(["1, 3, 4, 6, 7", "2, 5, 8, 9"])

###########################################################

=begin

Have the function LetterChanges(str) take the str parameter being passed and modify it using the following algorithm. Replace every letter in the string with the letter following it in the alphabet (ie. c becomes d, z becomes a). Then capitalize every vowel in this new string (a, e, i, o, u) and finally return this modified string.

input: string
output: new string
rules: 
- replace every letter with following letter
- if following letter is vowel, capitalize letter
data structure: array, string
problem: 
- What do i want to do with input?
  - map letters to their positions in alphabet
  - get current letter, find next following letter
  - if letter a vowel, capitalize it and replace old with new letter
  - if not vowel, still replace old with new letter
  - ignore non-letters, still add to new string
  - if letter goes past end of alphabet, reset at beginning of alphabet
algorithm:
- create an array of letters
- create arr of vowels
- create an empty string
- split string into array of chars
- iterate: 
  - if char and index + 1 position a vowel
    - upcase and add to new string
  - if not, add to new string
  - if not a letter, add to new string
  - if index + 1 letter is >= array size
    - subtract that index by array size to reset
=end

def letter_changes(str)
  letters = ('a'..'z').to_a
  vowels = 'aeiou'
  string = ""

  str.each_char do |char|
    if letters.include?(char)
      index = (letters.index(char) + 1)

      if index >= letters.size
        index -= 26
        if vowels.include?(letters[index])
          string << letters[index].upcase
        else
          string << letters[index]
        end
      elsif vowels.include?(letters[index])
        string << letters[index].upcase
      else
        string << letters[index]
      end
    else
      string << char
    end
  end
  string
end

p letter_changes("hello*3")
p letter_changes("fun times!")

########################################

=begin

Have the function AlphabetSoup(str) take the str string parameter being passed and return the string with the letters in alphabetical order (ie. hello becomes ehllo). Assume numbers and punctuation symbols will not be included in the string.

input: string
output: same string, sorted
rules: 
- assume only letters in string
- account for letter casing?
data structure: string, array
problem: 
- what do i want to do w/ input?
  - put string to a collection 
  - sort the string
  - return collection as a string
algorithm: 
- convert the string into array of chars
- sort string
- join array back into string
- return string
=end

def alphabet_soup(str)
  str.chars.sort.join
end

p alphabet_soup('coderbyte')
p alphabet_soup('hooplah')

########################################

=begin

Have the function LongestWord(sen) take the sen parameter being passed and return the largest word in the string. If there are two or more words that are the same length, return the first word from the string with that length. Ignore punctuation and assume sen will not be empty.

input: string
output: string
rules: 
- find longest word in sentence
- if more than 1, return first word
- ignore punctuation
data structure: array, string
problem: 
- what do i want to do with input?
  - delete anything that's not a letter
  - compare strings using size
  - find the longest word and return it
algorithm:
- split string into an array of words
- iterate: 
  - delete anything that is not a letter
  - find maximum word, (longest word)
- return word
=end

def longest_word(sen)
  result = []
  sen.split.each do |word|
    word.delete!("^a-zA-Z")
    result << word
  end
  
  result.max_by { |word| word.size }
end

p longest_word("fun&!! time")
p longest_word("I love cats")

############################################

=begin

Have the function FirstFactorial(num) take the num parameter being passed and return the factorial of it. For example: if num = 4, then your program should return (4 * 3 * 2 * 1) = 24. For the test cases, the range will be between 1 and 18 and the input will always be an integer.

input: integer, target number
output: integer, factorial
rules: 
- range between 1 and 18
- input always integer
data structure: range, integer
problem: 
- what do i want to do with input?
  - create a range of nums from 1 to target
  - multiply each number with num following it
  - compute sum as i go, returning sum at the end
algorithm:
- create range from 1 up to target
- create product varaible, set to 1
- increment product by each number
- return product
=end

def first_factorial(target)
  product = 1

  1.upto(target) do |n|
    product *= n
  end
  
  product
end

p first_factorial(4)
p first_factorial(8)
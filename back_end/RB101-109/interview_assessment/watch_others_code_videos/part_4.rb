=begin
Write a method that takes a single string argument and retuns a new string that contains the original
value of the argument, but the first letter of every word is now capitalized. 

You may assume that words are any sequence of non-blank characters, and that only the first character of each word must be capitalized.

input: string
output: a new string
rules: 
- new string will contain value of original string
- every word will be capitalized on the first letter
- if letter in middle of a word is already capitalized, it remains so in new string
data structure: array, string
pseudo-code: 
- given a string of words: 
- split string into an array of seperate words
- iterate over this array and pass each word to the block
- capitalize each word that gets passed in
- end iteration
- return new array and convert it back to a string
- each word will be seperated by a space
algorithm: 
- define word_cap method and pass in 'string' to it as argument
- split string into array using #split to convert to array of seperate words
- iterate using #map to return a new array
- invoke #capitalize on each word to convert it to its capitalized version
- invoke #join(' ') at the end of the method invocation of #map to convert
  to a string seperated by spaces
- end method
=end

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven years')
p word_cap('i love javascript')
p word_cap('owls are great hunters')


=begin
# Second Problem

# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

input: year as integer
output: integer representing how many friday.13ths there are in that year
rules: 
- year is greater than 1752
- this calendar will remain the same for the future
- 12 months in a year
- 12 13th's in a year
pseudo-code: 
- iterate through each month (12)
- create new date for each month, day = 13, month = current_month
- invoke #friday? to check if the 13th day of that current month falls on a friday
- if true, it will be counted
- return the result of all the occurrences
algorithm: 
- def friday_13th(year)
- initialize variable 'friday_13ths' to 0
- iterate over the months of a year using a range (1..12)
- use #each to iterate, passing in |month| through block
- add 1 to 'friday_13ths' if Date.new(year, month, day).friday? results to true
- end each iteration
- return 'friday_13ths' variable
- end method
=end
# require 'date'

def friday_13th(year)
  friday_13ths = 0
  (1..12).each do |month|
    friday_13ths += 1 if Date.new(year, month, 13).friday? # run puts Date.new(2015, 3, 13) to see what it outputs first before you add anything else
  end
  friday_13ths
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Third Problem

# Write a method that will generate random english math problems. The method should take a length, then
# return a math phrase with that many operations. 

# mathphrase(1) => "five minus two"
# mathphrase(2) => "two plus three times eight"
# mathphrase(3) => "one divided by three plus five times zero"

NUMBERS = %w(zero one two three four five size seven eight nine ten)
OPERATORS = %W(plus minus times divided)

def mathphrase(number_of_operations)
  operations = [NUMBERS.sample]
  number_of_operations.times do |number|
    operations << OPERATORS.sample
    operations << NUMBERS.sample
  end
  operations.join(' ').gsub('divided', 'divided by')
end

p mathphrase(1)
p mathphrase(2)
p mathphrase(3)

# Write a program that will generate random engish math problems of varying length.


10.times do |number|
  length = (1..20).to_a.sample
  p mathphrase(length)
end

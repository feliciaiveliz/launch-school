=begin

Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. 
If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces)

input: string
output: same string
rules: 
- replace all non-alphabetic chars with a space
- remove duplicate spaces
data structure: string
algorithm: 
- substitute any non letter/number with a space
- remove all space duplications
=end

# def cleanup(string)
#   string.gsub(/[^0-9A-Za-z]/, " ").squeeze
# end

# p cleanup("---what's my +*& line?")  == ' what s my line '

##########################################################

=begin

Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

input: string
output: hash
- keys: word sizes
- values: number of words of that size
rules: 
- words are any str of chars that don't include space
- if string empty, return an empty hash
data structure: string, array, hash
algorithm: 
- create a hash called word_sizes
- split the string into an array of words
- iterate over the array
- update the hash with the word size as key
- count the number of words of that size in the array
- return the hash
=end

def word_sizes(string)
  word_sizes = {}
  string = string.split
  string.each do |word|
    word_sizes[word.size] = string.count(word)
  end
  word_sizes
end

def word_sizes(string)
  string.split.map { |word| word.size }.tally
end

def word_sizes(string)
  counts = Hash.new(0)
  string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?")  == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

##########################################################################

=begin
Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. 
For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

input: integer
output: integer, sum of multiples
rules: 
- integer will be greater than 0
- supplied number will be included in sum
- if the number is a multiple of 3 or 5, add it to sum
- a multiple is a number that can be divided evenly by another number
data structure: integers
algorithm: 
- create a variable called sum, set it to 0
- from 1 up to the target number
  - increment sum:
    - if number divisble by 3 or 
    - if number divisible by 5
- return sum
=end

def multisum(number)
  sum = 0
  1.upto(number) do |n|
    sum += n if (n % 3).zero? || (n % 5).zero?
  end
  sum
end

def multisum(number)
  (1..number).select { |n| n if (n % 3).zero? || (n % 5).zero? }.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

####################################################################

=begin

Reverse an array without using the built-in #reverse method.

input: array
output: same array, reversed
data structure: array
algorithm: 
- given an array
- create a variable index, set it to 0
- iterate over the array
- remove the last element from the array
- insert it at the current index
- increment the index on each iteration
- continue until array is fully reversed
=end

def reverse!(list)
  index = 0
  list.size.times do 
    list.insert(index, list.pop)
    index += 1
  end
  list
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list  == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p reverse!(list) == []
p list == []

##############################################

=begin

Reverse an array without using #reverse or #reverse! Do not mutate the original array.

input: array
output: new array, reversed
algorithm:
- create an empty array
- iterate through the original array backwards
- add each element to the new array
- return that new array
=end

def reverse(list)
  array = []
  list.reverse_each { |n| array << n }
  array
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true 
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]  


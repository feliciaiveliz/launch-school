# Modify the kebabize function so that it converts a camel case string into a kebab case.

kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps

# Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.
# The input string always has more than five digits.

greatestProduct("123834539327238239583") // should return 3240

=begin
input: array of integers
output: integer that occurs most frequent in an array
rules:
- if two numbers occur the most, return the higher of the two numbers
algorithm:
- iterate through the array to the end
  - initialize unique_values to calling #uniq on input array
  - initialize result = {}
  - iterate over unique_values, given integer
    - update result: integer => input_array.count(integer)
  - #values and #max on result to return highest number
  - return #key and pass in result of #values and #max
=end

def highest_rank(array)
  result = {}
  unique_values = array.uniq.sort.reverse

  unique_values.each do |n|
    result[n] = array.count(n)
  end

  result.key(result.values.max)
end

p highest_rank([12, 10, 8, 12, 7, 6, 4, 10, 12]) == 12
p highest_rank([12, 10, 8, 12, 7, 6, 4, 10, 12, 10]) == 12
p highest_rank([10, 8, 12, 7, 6, 4, 10, 12, 10, 12]) == 12
p highest_rank([12, 10, 8, 8, 3, 3, 3, 3, 2, 4, 10, 12, 10]) == 3

# Kris

# Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

# Example
# "abcde" -> 0 # no characters repeats more than once
# "aabbcde" -> 2 # 'a' and 'b'
# "aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
# "indivisibility" -> 1 # 'i' occurs six times
# "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
# "aA11" -> 2 # 'a' and '1'
# "ABBA" -> 2 # 'A' and 'B' each occur twice

=begin
- input: string
- output: integer
- rules:
  - upper case and lower case alpha chars are considered the same
  - any char or digit that occurs more than once is counted towards output integer
- algo:
- input string downcased
- count = 0
- iterate through input string with uniq chars
  - for each item
    - if count of item in full input string is bigger than 1
      - add 1 to count
- return the count
=end

# def duplicate_count(string)
#   count = 0
#   string = string.downcase
#   uniq_str = string.chars.uniq.join

#   uniq_str.chars.each do |item|
#     count += 1 if string.count(item) > 1
#   end

#   count
# end

def duplicate_count(string)
  dups = Hash.new(0)

  string.each_char do |char|
    char.downcase!
    dups.include?(char) ? dups[char] += 1 : dups[char] = 1
  end

  dups.select { |k, v| v > 1 }.keys
end

p duplicate_count("abcde") #== 0
p duplicate_count("abcdeaa") #== 1
p duplicate_count("abcdeaB")# == 2
p duplicate_count("Indivisibilities") #== 2
p duplicate_count("aA11") #== 2

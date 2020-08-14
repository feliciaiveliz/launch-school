# Given a string, capitalize the letters that occupy even indexes and odd indexes separately, and return as shown below. Index 0 will be considered even.

# For example, capitalize("abcdef") = ['AbCdEf', 'aBcDeF']

# The input will be a lowercase string with no spaces.

=begin

input: string
output: array of two strings of alternate capitalization
problem:
- iterate twice over string characters
  - for first iteration
    - capitalize letters at even indexes
    - add to array called 'evens'
  - for second iteration
    - capitalize letters at odd indexes
    - add to array called 'odds'
- return 'result' that contains evens and odds
ALGORIHTM:
- initialize 'result' to []
- intialize 'odds' to ""
- intialize 'evens' to ""
- iterate using #chars and #eac_with_index, given letter and index
  - if index is even
    - capitalize letter
    - push the letter to even
  - if index is even
    - push the letter to even
  - end
- iterate using #chars and #eac_with_index, given letter and index
  - if index is odd
    - capitalize letter
    - push the letter to odds
  - if index is even
    - push the letter to odds
  - end
- push 'evens' to result
- push 'odds' to result
- return 'result'
=end

def capitalize(string)
  result = []
  odds = ""
  evens = ""
  
  string.chars.each_with_index do |letter, index|
    if index.odd?
      odds << letter.upcase
    else
      odds << letter
    end
  end
  
  string.chars.each_with_index do |letter, index|
    if index.even?
      evens << letter.upcase
    else
      evens << letter
    end
  end
  
  result << evens << odds
end

p capitalize("abcdef") == ['AbCdEf', 'aBcDeF']

def men_from_boys(arr)
  evens = []
  odds = []
  result = []
  
  arr.each do |n|
    n.even? ? evens << n : odds << n
  end
  
  evens.sort!
  odds.sort! { |a, b| b <=> a }
  
  result << evens << odds
  result.flatten.uniq
end

=begin

input: array of integers
output: array of integer, evens first then odds
problem:
- create two arrays, evens and odds
- iterate over 'arr' and select numbers:
  - evens will go to 'evens'
  - odds will go to 'odds'
- sort 'evens' by smallest to largest
- sort 'odds' by largest to smallest
- put evens then odds in larger array, filter out duplicates
ALGOIRTHM:
- initialize 'evens' to []
- initliaze 'odds' to []
- initialize 'result' to []
- iterate over 'arr' using #select:
  - select number and add to evens if number even
  - select number and add to odds if number odd
  - use #sort! b <=> a for 'evens' 
  - use #sort! for 'odds'
- push evens to result, then odds, flatten the array and filiter out duplicates
- return array
=end

=begin

input: array of digits
output: integer, minimum number
problem:
- sort the array from smallest to largets numbers
- filter out duplicates
- convert the array to integer
- return integer
ALGORITHM:
- use #sort on array a <=> b
- use #uniq on the array to delete duplicates
- convert: use #join and #to_i 
- return integer
=end

def min_value(digits)
  digits.sort.uniq.join.to_i
end

=begin

input: array of integers
output: integer, maximum triplet sum
problem:
- filter out duplicate numbers
- find the 3 largest numbers, add them together
- return sum
ALGORITHM:
- use #uniq on the array to delete duplicates
- use #max(3) and #sum to find largest 3 numbers and sum
- return value
=end

def max_tri_sum(numbers)
  numbers.uniq.max(3).sum
end

=begin

input: array of integers
output: array of two integers, weights of each team
problem:
- iterate over array:
  - put even indexed players into team1
  - put odd indexed players into team2
  - find total weight of each team
  - add both team weights to array
- return array
ALGORITHM:
- initailize 'team1' to []
- initialize 'team2' to []
- initialize 'weights' to []
- iterate over array using #each_with_index
  - if index is even, push number to team1
  - if index is odd, push number to team2
- sum both arrays, add both arrays to 'weights'
=end

def row_weights(array)
  team1, team2 = []
  array.each_with_index { |n, idx| idx.even? ? team1 << n : team2 << n }
  [team1.sum, team2.sum]
end


=begin

input: array of strings
output: new array of strings with format => n: string
problem:
- iterate over the string:
  - use index position plus 1 for the correct numbering
  - create sentence format 'index + 1: letter'
- return array
ALGORITHM:
- use #map and #with_index, given letter, idx:
  - interpolate: index + 1: letter, each line will be added to array
- return array
=end

def number(list)
  list.map.with_index(1) { |letter, idx| "#{idx}: #{letter}" }
end

p number(["a", "b", "c"])
=begin

Your team is writing a fancy new text editor and you've been tasked with implementing the line numbering.
Write a function which takes a list of strings and returns each line prepended by the correct number.
The numbering starts at 1. The format is n: string. Notice the colon and space in between.

input: array of strings
output: new array of strings
rules: 
- numbering starts at 1
- format => "n: string"
data structure: string, arrays
example: 
number [] # => []
number ["a", "b", "c"] # => ["1: a", "2: b", "3: c"]
problem: 
- find position of letter in the array
  - use it to retrieve the correct number for ordering
  - populate the array with string and it's correct number
algorithm:
- create a new array
- iterate with an index
  - use index + 1 for position
  - interpolate position: string
- return array
=end

def number(array)
  array.map.with_index do |letter, index|
    "#{index + 1}: #{letter}"
  end
end

p number([]) == []
p number(["a", "b", "c"]) == ["1: a", "2: b", "3: c"]

#####################################################

=begin

I've got a crazy mental illness. I dislike numbers a lot. But it's a little complicated: The number I'm afraid of depends on which day of the week it is... This is a concrete description of my mental illness:
Monday --> 12
Tuesday --> numbers greater than 95
Wednesday --> 34
Thursday --> 0
Friday --> numbers divisible by 2
Saturday --> 56
Sunday --> 666 or -666
Write a function which takes a string (day of the week) and an integer (number to be tested) so it tells the doctor if I'm afraid or not. (return a boolean)

input: string (day), integer (number)
output: boolean
rules: 
- return true if number and day meet condition of fear
problem:
- check if day and number are equal to the list of fears
- if it is, return true
- otherwise false
algorithm:
- if day is equal to Monday, and 'n' is equal to 12, true
- if day is equal to Tuesday, and 'n' > 95, true
- if day is equal to Wed., and 'n' equal to 34, true
- if thursday, and 0, true
- if friday, and n divisible by 2, true
- if sat., and 'n' is 56, true
- if sun, and n is 666, or n is -666, true
- false
=end

def am_I_afraid(day, number)
  return true if day == "Monday" && number == 12
  return true if day == "Tuesday" && number > 95
  return true if day == "Wednesday" && number == 34
  return true if day == "Thursday" && number == 0
  return true if day == "Friday" && number % 2 == 0
  return true if day == "Saturday" && number == 56
  return true if day == "Sunday" && (number == 666 || number == -666)
  false
end

p am_I_afraid("Monday", 13) == false
p am_I_afraid("Sunday", -666) == true
p am_I_afraid("Tuesday", 2) == false
p am_I_afraid("Tuesday", 965) == true
p am_I_afraid("Friday", 2) == true

def array_leaders(numbers)  
  numbers.select._with_index do |n, idx|
    n > numbers[idx + 1..-1].sum 
  end
end

=begin

Problem: Array Leaders (Array Series #3)

An element is leader if it is greater than The Sum all the elements to its right side.
Array/list size is at least 3 .
Array/list's numbers Will be mixture of positives , negatives and zeros
Repetition of numbers in the array/list could occur.
Returned Array/list should store the leading numbers in the same order in the original array/list .
Given an array/list [] of integers , Find all the LEADERS in the array.

input: array of integers
output: array of integer(s)
rules: 
- number is leader if > than sum of integers to right
- if number is last in array, compare it to 0
- preserve leading numbers order in the array
data structure: array, integers
problem: 
- start with first number
- if number > all numbers in array, add number to array
- move to second number
- if number > rest of numbers in array, add to array
- continue until we reach last number in array
algorithm: 
- create an empty array
- iterate: 
  - start with first element:
    - element > ((index + 1 to last element))- sum? if yes: add to array
  - second number
    - element > (index + 1 to last element)? if yes: add to array
  - continue with rest of array
=end

def array_leaders(numbers)
  numbers.select.with_index do |n, i|
    n > numbers[i + 1..-1].sum
  end
end

# Problem: Transform to Prime | 6kyu
# Given a List [] of n integers , find minimum mumber to be inserted in a list, so that sum of all elements of list should equal the closest prime number .

=begin

input: array of integers
output: integer
rules: 
- list size will be > 2
- digits will be positive
- numbers could repeat
- what is a prime number? 
  - # that can only be / by 1 and itself
data structure: array, integers
problem: 
- find sum of all digits in list
- find next closest prime number
- calculate difference: minimum number
algorithm:
- sum all digits, save to variable called sum
- create method called is_prime?
  - create a range from 2 to number
    - return false if n mod current number is equal to 0
- if sum is prime, return n - n
- else: 
- increment sum by 1 until we reach a prime number
- when prime is reached, return prime - sum
=end

def is_prime?(sum)  
  2.upto(sum - 1) do |n|
    return false if sum % n == 0
  end
  true
end

def minimum_number(numbers)
  sum = numbers.sum
  prime = sum
  
  prime += 1 until is_prime?(prime)
  prime - sum
end

##############################################

=begin

Problem: Row Weights

Several people are standing in a row divided into two teams.
The first person goes into team 1, the second goes into team 2, the third goes into team 1, and so on.
Given an array of positive integers (the weights of the people), return a new array/tuple of two integers, where the first one is the total weight of team 1, and the second one is the total weight of team 2.

input: array of integers, weights
output: array of two integers, total weights
rules: 
- even numbered (position) weights: team 1
- odd numbered (position) weights: team 2
- if only 1 integer, use weight for team 1, 0 for team 2
- if 0, use 0 for both teams
data structure: array, integers
problem: 
- add all weights in even numbered spots
- add all weights in odd numbered spots
- put both into an array
algorithm: 
- create two variables: 
  - team1
  - team2
- iterate over array with index
- if index even, increment team1 by weight
- same with odd, for team 2
- return weights for both teams
=end

def row_weights(array)
  team1 = 0
  team2 = 0

  array.each_with_index do |weight, idx|
    idx.even? ? team1 += weight : team2 += weight
  end

  [team1, team2]
end

p row_weights([13, 27, 49]) #== [62, 27]
=begin

Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

input: integer
output: string
rules: 
- string will always start with '1'
- length of string will match value of integer
- if number is odd, str will start w/ 1 and end w/ 0
- if number is even, str will start w/ 1 and end w/ 1
data structure: array, string
pseudo-code: 
- create an empty string called 'string'
- use the number as the value to iterate over
- iterate using the index of the current number
  - if index is even, push a '1' to the new string
  - if index is odd, push a '0' to the new string
- end iteration
- return string
algorithm: 
- define stringy method, pass in one parameter 'number'
- initialize empty string called 'string'
- use #times method on 'number'
- pass index to block 
- use ternary, if index is even? then append '1' to 'string'
  - if index is odd? then append '0' to 'string'
- end iteration
- return 'string'
=end

def stringy(number)
  string = ''
  number.times do |index|
    index.even? ? string << '1' : string << '0'
  end
  string
end

p stringy(6)
p stringy(9) 
p stringy(4)
p stringy(7)

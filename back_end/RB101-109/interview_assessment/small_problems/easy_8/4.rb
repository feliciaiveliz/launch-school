=begin

Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the substrings_at_start method you wrote in the previous exercise:

input: string
output: array of substrings
rules: 
- start at position 0, then subsequent substrings will start at 1, 2, etc.
- arrange strings from shortest to longest string
- use substrings_at_start method
example: 
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
data structure: array, strings
pseudo-code: 
- use substrings_at_start method from previous exercise
- create a variable to represent the starting index
  - start_substring = 0
- create a loop that will use substrings_at_start to create substrings
- increment 'start_substring' by 1 after iteration
- break if 'start_substring' is equal to the size of the string minus 1
algorithm: 
- substrings_at_start(string)
- init. variable 'start_substring' = 0
- enter a loop 
  - substrings_at_start(string)
  - increment 'start_substring += 1'
- break out of loop if 'start_substring == string.size - 1'
- return 'substrings'
=end

def substrings_at_start(string)
  substrings = []
  string.size.times do |index|
    substrings << string[0..index]
  end
  substrings
end

def substrings(string)
  substrings = []
  start_index = 0

  loop do 
    string.size.times do |index|
      substrings << string[start_index..index]
    end
    start_index += 1
    break if start_index == string.size
  end
  substrings
end

# ls solutin

def substrings(string)
  substrings = []
  (0..string.size).each do |start_index|
    current_substring = string[start_index..-1]
    substrings.concat(substrings_at_start(current_substring))
  end
  substrings
end

p substrings('abcde')
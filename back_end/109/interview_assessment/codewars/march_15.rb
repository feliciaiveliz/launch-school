# Problem 1: Sort Arrays (Ignoring Case) | 6kyu

# Sort the given strings in alphabetical order, case insensitive. For example:

# ["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"]
# ["C", "d", "a", "B"])              -->  ["a", "B", "C", "d"]

=begin

input: array of unsorted strings
output: array of sorted strings
problem: 
- change case of all letters to lowecase
- compare each element to each other
- sort elements in alphabetical order
algorithm: 
- sort elements using #sort
- downcase each element before comparison using #downcase
=end

# def sortme(strings)
#   strings.sort { |a, b| a.downcase <=> b.downcase }
# end

# p sortme(["Hello", "there", "I'm", "fine"])
# p sortme(["C", "d", "a", "B"])

# Problem 2: Count letters in string | 6 kyu

# In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'. The key must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.

=begin

input: string
output: hash: keys => letters (symbols), values => count
problem: 
- count each letter 
- keep a tally for every letter
algorithm: 
- split string using #chars
- convert keys (strings) to symbols
- call #tally to create hash 
=end

# def letterCount(string)
#   string.chars.map { |letter| letter.to_sym }.tally
# end

def letterCount(string)
  count = Hash.new(0)

  string.chars.each do |letter|
    count[letter] += 1
  end
  count
end

def letterCount(string)
  string.chars.each_with_object(Hash.new(0)) { |l, h| h[l.to_sym] += 1 }
end

p letterCount('arithmetics')


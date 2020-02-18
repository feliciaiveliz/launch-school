# Example 1: 

a = 5

loop do
  a = 7
  break
end

p a   # 7

# Example 2: 

# number = 5

# def a_method
#   puts number
# end

# a_method # error, undefined method or variable 'number'
# variables in the outer scope must be passed in as a parameter

number = 5

def a_method(num)
  puts num
end

a_method(number)

# Example 3: 

def a_method(number)
  number = 7
end

a = 5
p a_method(a)
p a


# Interview 1: 

=begin

Have the method letter_changes(str) take the str parameter being passed and
modify it using the following algorithm. Replace every letter in the string
with the 3rd letter following it in the alphabet (ie. c becomes f, Z becomes C).
Then return this modified string.

input: string
output: new string
rules:
- replace letter with 3rd letter following it in alphabet
- ignore anything that's not a letter, add it to string as is
- if letter is capital letter, add 3rd letter following it as capital
data structures: string, array
problem: 
- What do i want to do with the input?
  - map letters in alphabet with their positions
  - iterate over the string and replace each letter with it's 3rd follow. letter
  - add punct/digits to str as it is, then move on to the next char
  - if we add 3 to current letter index, and it 's greater than or equal to array size, 
    start over from beginning of alphabet
algorithm:
- create an array of upper letters
- create array of lower letters
- create an empty array to add letters to
- split the string into an array of chars
- iterate: 
  - if the char is included in the lower array
    - assign to index the index of the letter i need (3rd)
    - add it's 3rd following letter to the new array
  - if the char is included in the upper array
    - add it's 3rd following letter to the new array
  - if it's not included in either array
    - add char into the array
  - if the index of the 3rd char is >= array
=end

def letter_changes(string)
  upper = ("A".."Z").to_a
  lower = ("a".."z").to_a
  result = []
  
  string.each_char do |char|
    if upper.include?(char)
      index = (upper.index(char) + 3) % 26
      result << upper[index]
    elsif lower.include?(char)
      index = (lower.index(char) + 3) % 26
      result << lower[index]
    else
      result << char
    end
  end
  result.join
end

string.each_char do |char|
  if upper.include?(char)
    result << upper[(upper.index(char) + 3) % 26]
  elsif lower.include?(char)
    result << lower[(lower.index(char) + 3) % 26]
  end
  result
end


p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')



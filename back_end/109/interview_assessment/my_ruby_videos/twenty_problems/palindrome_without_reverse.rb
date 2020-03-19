# Given a word as a string, write a method to determine if a word is
# a palindrome, without using the `reverse` method.

=begin

PROBLEM - 
input: string
output: boolean
question: what should be done with the input?
- given string, reverse it without using #reverse
- check if reversed string is equal to input string
ALGORITHM:
- create copy of input array using #dup
- split string using #chars
- use #size and #times to iterate over array:
  - use 'n' to represent the index
  - insert last element using #insert and #pop at current index 'n'
- once array is reversed, convert it to string using #join
- compare it to input string
=end

def reverse(string)
  temp_string = string.chars

  temp_string.size.times do |idx|
    temp_string.insert(idx, temp_string.pop)
  end

  string == temp_string.join
end

p reverse('mom') == true
p reverse('hannah') == true
p reverse('racecars') == false
p reverse('noon') == true
p reverse('popp') == false

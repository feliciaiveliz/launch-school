=begin

Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

input: string
output: a new string
rules: 
- if letter uppercased, lowercase it
- if letter lowercased, uppercase it
data structure: array, string
pseudo-code: 
- split string into an array of individual chars
- if the char is equal to its uppercased version, lowercase it
- if the char is equal to its lowercased version, uppercase it
- otherwise return the char unmodified
algorithm:
- create two arrays, one to hold uppercased letters, the other lowercased
- convert str into array of chars using #chars
- iterate over the array of strs using #each
- for each char that gets passed to the block: 
  - if lowercased array includes the char, upcase it, and append to array
  - if uppercased array includes the char, downcase it, and append to array
  - else append the char to array
- join array into a string
- end
=end

LOWER = ('a'..'z').to_a
UPPER = ('A'..'Z').to_a

def swapcase(string)
  swapcased = []

  string.chars.each do |char|
    if LOWER.include?(char)
      swapcased << char.upcase
    elsif UPPER.include?(char)
      swapcased << char.downcase
    else
      swapcased << char
    end
  end
  swapcased.join
end

# or

def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

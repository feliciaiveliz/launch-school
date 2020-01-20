=begin

Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

input: string
output: a new string
rules: 
- str contains original value
- every other char should be capitalized
- all remaining chars should be lowercased
- non-letter chars should count as a char, but should not be changed
- if the str ends in lowercase, the next word starts with uppercased
- if the str ends in uppercase, the next word starts with lowercased
data structure: array, string
pseudo-code: 
- create an empty array
- split string into an array of chars
- iterate over this array of chars
- capitalize the first letter based on even index
- lowercase the letter based on odd index
- convert array into string 
algorithm: 
- init. empty array called staggered_caps = []
- split str using #chars and iterate using #each_with_index
- if the index is even? (I is position 0), upcase the char
- if the index is odd? (" " is position 1), downcase the char
- end iteration
- return array and join it (' ')
=end

def staggered_case(string)
  staggered_caps = []
  string.chars.each_with_index do |char, index|
    if index.even? 
      staggered_caps << char.upcase
    elsif index.odd?
      staggered_caps << char.downcase
    end
  end
  staggered_caps.join
end

def staggered_caps(string)
  result = ""
  uppercase = true
  string.chars.each do |char|
    if uppercase
      result += char.upcase
    else
      result += char.downcase
    end
    uppercase = !uppercase
  end
  result
end

def staggered_case(string)
  a = string.chars.map.with_index do |char, index|
    index.even? ? char.upcase : char.downcase
  end
  a.join
end

p staggered_case('I Love Launch School!')
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

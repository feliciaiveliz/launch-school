=begin

Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

input: string
output: new string
rules: 
- every other character should be capitalized
- remaining characters are lowercase
- non-letter characters should be counted as characters when switching cases
- sentence starts with capital letter
examples: 
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
data structure: array, string
algorithm: 
- define staggered_case(string) method
- split string into array of 'chars' and save to variable caps
- call #map of array to return new array
- string.split.map { |char| }
- use index to iterate over every other letter- index += 2
- letter.upcase
- use lower_index to iterate over odd numbered index letters- index += 1
- letter.downcase
- return array and call #join
- end method
=end 

def staggered_case(string)
  caps = []
  string.chars.each_with_index do |char, index|
    if index.even?
      caps << char.upcase
    elsif index.odd?
      caps << char.downcase
    else
      char
    end
  end
  caps.join
end

p staggered_case('I Love Launch School!') 
p staggered_case('ALL_CAPS')
p staggered_case('ignore 77 the 444 numbers')





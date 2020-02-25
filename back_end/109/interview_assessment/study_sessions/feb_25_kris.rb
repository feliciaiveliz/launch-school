#Given a string, capitalize the letters that occupy even indexes and odd indexes separately, and return as shown below. Index 0 will be considered even.

#For example, capitalize("abcdef") => ['AbCdEf', 'aBcDeF']. See test cases for more examples.

=begin

input: string
output: array of two strings
rules: 
- first string: captialize letters at even index
- second string: capitliaze letters at odd index
- assume only letters in string
problem: 
- iterate over string: 
  - capitalize even index letters
  - add odd index letters as is
- second pass: 
  - capitalize odd index letters
  - add even index letters as is
algorithm: 
- create an two empty strings
- split string into array of chars
- iterate with index: 
  - check if index is even
    - cap. letter, push to string
  - if odd, 
    - push letter to str
- once first str is completed
  - repeat previous steps: 
    - check if index is odd
    - cap. letter, push to second string
    - push letter 
- push strings into array
=end

# def capitalize(string)
#   first_string = ""
#   second_string = ""
#   result = []
  
#   string = string.chars
  
#   string.each_with_index do |letter, index|
#     if index.even?
#       first_string << letter.capitalize
#     else
#       first_string << letter
#     end
#   end
  
#   string.each_with_index do |letter, index|
#     if index.odd?
#       second_string << letter.capitalize
#     else
#       second_string << letter
#     end
#   end
  
#   result << first_string << second_string
# end

def capitalize(string)
  first_str = ""
  second_str = ""
  string = string.chars

  string.each_with_index do |letter, index|
    index.even? ? first_str << letter.capitalize : first_str << letter
  end

  string.each_with_index do |letter, index|
    index.odd? ? second_str << letter.capitalize : second_str << letter
  end
  
  [first_str, second_str]
end

p capitalize("abcdef") == ['AbCdEf', 'aBcDeF']
p capitalize("codewars") == ['CoDeWaRs', 'cOdEwArS']
p capitalize("abracadabra") == ['AbRaCaDaBrA', 'aBrAcAdAbRa']
p capitalize("codewarriors") == ['CoDeWaRrIoRs', 'cOdEwArRiOrS']
p capitalize("indexinglessons") == ['InDeXiNgLeSsOnS', 'iNdExInGlEsSoNs']
p capitalize("codingisafunactivity") == ['CoDiNgIsAfUnAcTiViTy', 'cOdInGiSaFuNaCtIvItY']

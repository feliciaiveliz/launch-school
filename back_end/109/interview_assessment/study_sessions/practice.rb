=begin

Pay attention to test cases. Read all of them carefully.

Given the string of chars a..z A..Z do as in the sample cases

input: string
output: new string
rules: 
- for char of each sequence should be capitalized
- the rest of the letters are lowercased
- the sequences are seperated by "-"
- the char's position in the str determines how many chars are printed
  - a is first, a is printed once
algorithm: 
- create a new array
- split the str argument into an array of chars
- save this to a variable
- return the size of the string
  - this size will be used to calc. how many letters are printed
- for the size of the string, iterate that many times
- push the current letter captialized to the array
- plus the letter lowercased (n) times to the array
- once iteration is done, join the array into a string
- each sequence will be joined by a "-"
- return the array
=end

def accum(string)
  string.chars.map.with_index do |letter, index|
    (letter * (index + 1)).capitalize
  end.join("-")
end
 
p accum("abcd") == "A-Bb-Ccc-Dddd"
p accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
p accum("cwAt") == "C-Ww-Aaa-Tttt"


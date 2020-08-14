# Given the string of chars a..z A..Z do as in the sample cases.


=begin

PROBLEM - 
input: string
output: a new string
question: what should be done with input?
- iterate over string
  - print each letter as many times as its position
    - print 'a' 1 time, 'b' 2 times, etc.
  - capitialize each letter sequence
  - place a "-" between all sequences

ALGORITHM - 
- iterate using #chars #map and #with_index:
  - multiply current letter with index + 1
  - capitalize each letter sequence
- call #join('-')
=end

def accum(string)
  string.chars.map.with_index do |letter, index|
    (letter * (index + 1)).capitalize
  end.join("-")
end

p accum("abcd") == "A-Bb-Ccc-Dddd"
p accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
p accum("cwAt") == "C-Ww-Aaa-Tttt"

# first try: 7 minutes 5 seconds
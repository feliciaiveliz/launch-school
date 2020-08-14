=begin

Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

input: string
output: integer ordinal value
rules: 
- if string is empty, return 0
data structure: integer
pseudo-code: 
- create a variable called 'ord' that is set to 0
- split string into array of chars
- iterate over string
- call ord on each character and add it to the sum
- return variable
algorithm: 
- init. variable called 'ord'
  - set it to 0
- invoke #chars on string and iterate using #each
- add ord value of each char to 'ord' for each char
- end iteration
- return the 'ord' variable
=end

def ascii_value(string)
  ord = 0
  string.chars.each { |char| ord += char.ord } 
  ord
end

# or

def ascii_value(string)
  ord = 0
  string.each_char { |char| ord += char.ord }
  ord
end

# further exploration

char.ord.chr == char

"f".ord.chr == "f"

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
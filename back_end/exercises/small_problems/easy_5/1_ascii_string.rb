=begin

Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

input: a string
output: integer
rules: 
- string can be 0 or more words or characters
- string can have upper or lower cased characters
- string can include spaces
- string can be empty and should return zero
- ASCII string value means the sum of the ASCII values of every character in string
- use String#ord to determine ASCII value of every character
examples: 
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0
data structure: array
algorithm: # TRY
- define ascii_value method w/ string param
- save to ordinal result of calling chars.each on string
- initialize sum variable to zero 
- iterate over array and add each ordinal value to sum
- return ordinal variable
- end method
=end

def ascii_value(string)
  return 0 if string.empty? # not needed
  sum = 0
  string.chars.each do |char| # can use each_char instead
    sum += char.ord # do this on single line
  end
  sum
end

# refactored
def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end

p ascii_value('Four score') 
p ascii_value('Launch School')
p ascii_value('a')
p ascii_value('')

# Further Exploration
# char.ord.chr- chr is mystery method. If called on a longer string then it returns the first character
=begin
input: string of integers
output: integer
rules: 
- cannot use String#to_i or Integer()
- do not worry about + or -
- assume all characters will be numeric
examples: 
string_to_integer('4321') == 4321
string_to_integer('570') == 570
string_to_integer('0') == 0
data structure: string, integer, array
algorithm: 
- create hash to hold all number values from 0-9- '0' => 0
- create string_to_integer method with 'string' param
- split string into array of characters - str.chars and save it to digits variable for use later
- call map on string.chars to grab corresponding key-value pair from DIGITS hash
  - ['1', '2', '3', '4']
- return digits variable
- initialize value to 0
- start digits .each method to iterate over hash to convert string integers to integers
- value = 10 * value + digit
- this will repeat for the length of array
- return value
- end method
=end

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map do |char| # '4321'
    DIGITS[char]  # ['4', '3', '2', '1']
  end 
  digits  # => [4, 3, 2, 1]
end

p string_to_integer('4321')

value = 0
  digits.each { |digit| value = 10 * value + digit }
              10 * 0 + 4 -> 4 # 4 gets assigned to value 
              10 * 4 + 3 -> 43 # 43 gets assigned to value
              10 * 43 + 2 -> 432 # 432 gets assigned to value
              10 * 432 + 1 -> 4321 # 4321 gets assigned to value
  value # 4321 is returned
end

p string_to_integer('4321') 
p string_to_integer('570') 
p string_to_integer('0')
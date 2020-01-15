=begin

The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

input: string
output: integer
rules: 
- all chars. will be numeric
- cannot use String#to_i
- cannot use Integer()
- don't worry about + - signs
data structure: strings, integers
pseudo-code: 
- create a hash that contains all numbers to their corresponding digits
  "0" => 0, "1" => 1, etc.
- create variable to hold new number
- split string into array of chars.
- iterate over array
- map each digit string to its number from array
- push that number to the variable number
- return number at end
algorithm: 
- init. hash called digit_strings = {}
- init. variable called 'number'
- split string into chars. using #chars
- iterate using #each
- number << digits_hash[string]
- end iteration
- return variable 'number'
=end

DIGITS = { "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, 
           "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9 }

def string_to_integer(string)
  digits = string.chars.map { |str| DIGITS[str] }

  base = 0
  digits.each { |digit| base = 10 * base + digit }
  
  base
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

=begin

In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

input: string of digits
output: integer
rules: 
- starts with -, return -
- starts with +, return +
- starts with neither, return number
data structure: hash
pseudo_code:
- use if/else statement to capture possible outcomes
- if str starts with -, return -base
- if str starts with +, return base
- else return base
=end
require 'pry'

DIGITS = { "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, 
           "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9 }

def string_to_integer(string)

  digits = string.chars.map { |str| DIGITS[str] }

  base = 0
  digits.each { |digit| base = (10 * base) + digit }
  base
end

def string_to_signed_integer(string)
  if string.start_with?("-")
    -string_to_integer(string[1..-1]) 
  elsif string.start_with?("+")
    string_to_integer(string[1..-1])
  else
    string_to_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
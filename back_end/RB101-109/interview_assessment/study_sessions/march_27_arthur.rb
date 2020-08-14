=begin

Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages. Other than digits, the number may also contain special character such as spaces, dash, dot, and parentheses that should be ignored.

The rules are as follows:

    If the phone number is less than 10 digits, assume that it is a bad number.
    If the phone number is 10 digits, assume that it is good.
    If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits.
    If the phone number is 11 digits and the first number is not 1, then it is a bad number.
    If the phone number is more than 11 digits, assume that it is a bad number.

For bad numbers, just a return a string of 10 0s.

=end

=begin

input: string of digits, and punct.
output: string, either 0s or 10 numbers
problem:
- iterate over string:
  - add each number to a new string
  - ignore punct.
- if string size is > 11, return 10 0s
- if string size == 11, and first digit is not 1, return 10 0s
- if string size == 11, and first digit is 1, remove 1 and return number
- if string size == 10, return the string
- if string size < 10, return 10 0s
ALGORITM:
- initialize 'digits' to arry of string digits
- initialize result to ""
- iterate using #each_char:
  - if current char is included in the digits array
    - push the number to the string
  - else 
    - skip iteration
  - end
- with result:
  - assign 'size' to size of result
  
  - if string size is > 11, return 10 0s
  - if string size == 11:
    - and first digit is not 1, return 10 0s
  - if string size == 11:
    - and first digit is 1,
    - put string into array
    - remove first number using #shift
    - convert back to string, return string
    - if string size == 10, return the string
  - if string size < 10, return 10 0s
=end

def phone_numbers(string)
  digits = %w(0 1 2 3 4 5 6 7 8 9)
  result = ""
  
  string.each_char do |char|
    if digits.include?(char)
      result << char
    end
  end
  
  size = result.size
  
  if size == 11 && result[0] == "1"
    return result[1..-1]
  elsif size == 10
    return result
  else
    return "0000000000"
  end
end

p phone_numbers("210.345.6789") == "2103456789"
p phone_numbers("(121)-863-2413") == "1218632413"
p phone_numbers("1-710-653-2459") == "7106532459"
p phone_numbers("3-467-468-6521") == "0000000000"
p phone_numbers("4-567-8954-2526") == "0000000000"
p phone_numbers("123")

=begin

The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers Canadian Social Insurance Numbers.

The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:

    Counting from the rightmost digit and moving left, double the value of every second digit
    
    For any digit that thus become 10 or more, subtract 9 from the result
        1111 becomes 2121
        8763 becomes 7733 (from 2 x 6 = 12 -> 12 - 9 = 3 and 2 x 8 = 16 -> 16 - 9 = 7)
    Add all these digits together
        1111 becomes 2121 sums as 2 + 1 + 2 + 1 to give a checksum of 6
        8763 becomes 7733, and 7 + 7 + 3 + 3 is 20

If the total (the checksum) ends in 0 (put another way, if the total modulus 10 is congruent to 0), then the number is valid according to the Luhn Formula; else it is not valid. Thus, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).

Write a program that, given a number in string format, check if it is valid per the Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid. You can ignore all non-numeric characters in the input string.

=end

=begin

input: string of digits
output: boolean
problem:
- given string of digits:
  - delete spaces if any
  - convert to integers
  - put integer into an array
- create a new array:
  - iterate over numbers array:
    - if number is at an even idx, add number to new array
    - if number is at an odd idx, double the number:
      - if number > 10, subtract 9 and add new number to array
      
- with new array of numbers, add numbers together
- if sum mod 10 is 0 return true
- otherwise return false
ALGORITHM:
- iniitalize 'result' to []
- initilaize 'new_string' to ""
- initialize 'numbers' to array of string digits 0-9
- iterate with #chars and #each to add only string digits to new_string

- convert string to integer using #to_i

- put integer into array using #digits
- iterate over 'digits' using #each_with_index
  - if idx even?, push number to result
  - if idx odd?, 
    - assign to 'number' current number * 2
    - if number > 10, reassign 'number' to number - 9
      - push number to result
  - end
- given result, 
- assign to 'sum' => use #sum to add all numbers together
- sum % 10 == 0
=end

def formula(string)
  numbers = %w(0 1 2 3 4 5 6 7 8 9)
  new_string = ""
  result = []
  sum = 0
  
  string.chars.each do |char|
    new_string << char if numbers.include?(char)
  end
  
  new_string = new_string.to_i
  
  new_string.digits.each_with_index do |n, idx|
    if idx.even? 
      result << n
    else
      number = n * 2
      if number >= 10
        number -= 9
        result << number
      else
        result << number
      end
    end
  end
  
  sum = result.sum
  sum % 10 == 0
end

p formula("2323 2005 7766 3554") == true
p formula("1111") == false
p formula("8763") == true
p formula("4263") == false
p formula("7377") == true
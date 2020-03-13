=begin
There is an array with some numbers. All numbers are equal except for one. Try to find it!

find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

It's guaranteed that array contains at least 3 numbers.
=end

=begin

input: array of integers
output: integer, unique number
problem: 
- iterate through the array
- check if current number is equal to last number
- if it is, skip iteration
- if not, return number
algorithm: 
- check if first two numbers are equal
- if they're the same, check 
- iterate: 
  - check if current number is equal to first
    - if it is, skip iteration
  - if it isn't, return number

=end

# Given a number, return a string with dash'-' marks before and
# after each odd integer, but do not begin or end the string
# with a dash mark.

dashatize(274) == '2-7-4'
dashatize(6815) == '68-1-5'
dashatize(86320) == "86-3-20"
dashatize(974302) == "9-7-4-3-02"
dashatize(952937561) == '9-5-2-9-3-7-5-6-1'
dashatize(nil) == "nil"
dashatize(0) == "0"
dashatize(-1) == "1"
dashatize(-28369) == "28-3-6-9"

=begin

input: integer
output: string, with dashes before and after each integer
rules: 
- cannot begin or end string with "-"
- return positive str if number is negative
problem: 
- what do i want to do with the input?
  - check if number is positive or negative: 
    - if negative, 'add' the positive of the number
    - otherwise, 'add' number as is
  - if number is 0, 'add' 0
  - if nil, 'add' 'nil'
  - if number is odd: 
    - 'add' number then "-"
  - if number is even: 
    - 'add' even number, check next number
- check last number if it's even or odd
  - if odd, 'add' number, don't add "-"
algoritm: 
- return nil if number is 'nil'
- return "0" if number is 0
- if number is negative, remove the negative sign
  - convert number to string and delete "-", convert back to integer
- puts integer into an array using #digits and #reverse
- create an empty string
- iterate: 
  - if number is odd, 
  - convert to string, push number to string, then "-"
  - else, push number to string
- continue for length of array
- after iteration, check if last character is "-", delete if so
- return string
=end

def dashatize(number)
  return nil if number.nil?
  return "0" if number.zero?
  number = number.to_s.delete("-").to_i
  number = number.digits.reverse
  string = ""
  
  number.each do |n|    
    if n.odd? 
      n = n.to_s
      string << n << "-"
    else
      n = n.to_s
      string << n
    end
  end
  string
end

p dashatize(274) #== '2-7-4'
p dashatize(6815) #== '68-1-5'
p dashatize(86320) #== "86-3-20"
p dashatize(974302) #== "9-7-4-3-02"
p dashatize(952937561) #== '9-5-2-9-3-7-5-6-1'
p dashatize(nil) #== "nil"
p dashatize(0) #== "0"
p dashatize(-1) #== "1"
p dashatize(-28369) #== "28-3-6-9"

def dashatize(integer)
  return "nil" if integer.nil?

  integer_as_string = integer.abs.to_s
  return integer_as_string if (integer_as_string.length == 1) && integer.negative?

  integer.abs.digits.reverse.each_with_object([]) do |digit, result|  
    is_odd = digit.odd?
    result_last_is_even = result.last.to_i.even?
    last_digit = ((integer_as_string.length - 1) == result.size)

    result << if is_odd && result.empty?
                digit.to_s << "-"
              elsif is_odd && result_last_is_even && last_digit
                "-" << digit.to_s
              elsif is_odd && result_last_is_even && !last_digit
                '-' << digit.to_s << '-'
              elsif is_odd && !last_digit
                digit.to_s << '-'
              else
                digit.to_s
              end
    end.join
end

# num ? num.to_s.scan(/[02468]+|[13579]/).join("-") : "nil"

# https://www.codewars.com/kata/58223370aef9fc03fd000071
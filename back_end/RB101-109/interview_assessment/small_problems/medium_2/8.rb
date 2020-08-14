=begin

A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).
Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.

input: integer, starting number
output: integer, featured number
rules: 
- featured number: 
  - multiple of 7
  - odd number
  - digits occur exactly once
  - number greater than starting number
data structure: 
algorithm:
- create a variable set it to 0
- 'n' is argument number
- increment variable by 7 to create a multiple
- if variable > 'n' and number is odd and if number
  doesn't occur more than once in the number, return number
- otherwise keeping incrementing
=end

def featured(number)
  n = 0
  loop do
    n += 7
    return n if n > number && n.odd? && n.digits.uniq == n.digits
    break if number >= 9_876_543_210
  end
  "There is no possible number that fullfills those requirements."
end

def featured(n)
  loop do 
    n += 1
    if (n % 7).zero? && n.odd?
      return n if n.digits.uniq == n.digits
    end
    return "There is no possible number that fullfills those requirements." if n > 987654321
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999)
# Write a method that returns a list of all of the divisors of the positive
# integer passed in as an argument. The return value can be in any 
# sequence you wish.

=begin

input: positive integer
output: array of positive divisors of integer
question: what should be done with the input?
- divisor: number that can be divided into another number evenly ()
- create a range from 1 to 'number'
- iterate: 
  - number mod 'n' == 0, return 'n'
ALGORITHM:
- 1 to 'number'
- use #select to iterate and select numbers that return true for:
  - number % 'n' == 0
- return list of divisors
=end

def divisors(number)
  (1..number).select do |n|
    number % n == 0
  end
end


p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]
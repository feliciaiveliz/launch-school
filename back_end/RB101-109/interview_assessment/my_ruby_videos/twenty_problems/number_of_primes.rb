# Print all the primes between 2 numbers without using the prime class.
#
# You will always be given two positive integers. One or both of the integers can be zero.

=begin

PROBLEM - 
input: two positive integers, one can be 0
output: array of prime numbers
question: what should be done with input?
- create a range from first to second
- to calculate primes: 
  - range from 2 to (n - 1); check if 'n' divides evenly into 
    current number. If it does, return false as it is not prime
ALGORITHM -
- define is_prime?(number)
  - create range from 2 to (n - 1)
  - false if number mod 'n' is equal to 0
- true otherwise
- define primes_between(first, second)
- use #select to iterate over range of given numbers
- select numbers that are prime when passed to 'is_prime?'
=end

def is_prime?(number)
  (2..(number - 1)).each do |n|
    return false if number % n == 0
  end
  true
end

def primes_between(first, second)
  range = (first..second).to_a
  primes = range.select { |n| is_prime?(n) && n > 1 }
  primes
end

p primes_between(1, 5) == [2, 3, 5]
p primes_between(3, 10) == [3, 5, 7]
p primes_between(3, 7)  == [3, 5, 7]
p primes_between(8, 9)  == []
p primes_between(0, 1) == []


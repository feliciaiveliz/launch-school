# Write a method that will take an array of numbers, and return the number of primes in the array.

=begin

PROBLEM -
input: array of integers
output: integer, number of primes in array
question: what should be done with input?
- create a method that will calculate prime numbers
- check if a number from array is prime; count number
ALGORITHM -
- create is_prime? method
  - from 2 to (one less) than number passed in:
    - return false if number mod 'n' is == 0
  - return true
- is number is prime and is not equal to 1, select number in array and count #
=end

def is_prime?(number)
  (2...number).each do |n|
    return false if number % n == 0
  end
  true
end

def count_primes(array)
  array.count { |n| is_prime?(n) && n != 1 }
end

p count_primes([4, 2, 6, 3, 7, 4, 5, 1]) == 4
p count_primes([1, 5, 7, 9]) == 2
p count_primes([4, 6, 8]) == 0
p count_primes([1, 2]) == 1

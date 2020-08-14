# Example 1 

a = 5

loop do 
  a = 7
  break
end

p a

# Example 2

number = 5

def a_method
  puts number
end

a_method

# Error, local variables need to be passed in to a method definition in order for it to be used by the method definition.

number = 5

def a_method(integer)
  puts integer
end

a_method(number)

# Example 3

def a_method(number)
  number = 7
end

a = 5
a_method(a)
p a

# ##### Part 2: Interview ######

=begin

For "x", determine how many positive integers less than or equal to "x" are odd but not prime. Assume "x" is an integer between 1 and 10000.

Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.

=begin
input: integer between 1 and 10,000
output: integer; numbers that are odd and not prime
data structure: array, integer
algorithm: 
- create prime? method
  - from 1 up to 'n', if number is evenly divisible by the integer passed to block
    - is it NOT prime 
  - true otherwise
- create an empty array
- if number is not prime, (return false) and it's odd
  - push to array
  - if number is 1, push to array
- count the number of digits in array
=end

def not_prime?(n)
  return true if n == 1
  (2...n).each do |num|
    return true if n % num == 0  # a number is NOT prime because it IS divisible by another number: 9 % 3 == 0
  end
  false
end

def odd_not_prime(n)
  (1..n).select do |num|  
    num if num.odd? && not_prime?(num)
  end.count
end

p odd_not_prime(15)
p odd_not_prime(48)
p odd_not_prime(82)

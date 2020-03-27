# Print all the primes between 2 numbers without using the prime class

=begin

input: two integers, starting point and ending point
output: empty string or string that contains all primes between input numbers
problem:
- prime: a number that is only divisible by 1 and itself
- create a range from intger 1 and integer 2
- for each number: check if it's a prime number
- if number evenly divisible by current number, not prime
ALGORITHM:
- create range from integer_1 to integer_2, use #each to iterate:
  - for each number
- create method calculate_primes:
  -2 to (one less than)'number'
    - if number mod n != 0
      - return true
- call #join with ", "
- return string
=end

# for each number between 2 and the given number:
# - check whether the given number is divisible by the current number
# - if it is divisible, then it's not a prime
# if at the end of the iteration, the number couldn't be evenly divided by the elements, then it's a prime 

def calculate_primes(number)
  (2...number).each do |n|
    return false if number % n == 0
  end
  true
end

# p calculate_primes(3) == true
# p calculate_primes(9) == false

def find_primes(integer_1, integer_2)
  (integer_1..integer_2).select do |number|
    calculate_primes(number)
  end.join(", ")
end

p find_primes(3, 10) #== '3, 5, 7'
p find_primes(3, 7)  #== '3, 5, 7'
p find_primes(8, 9)  #== ''

# Write a program that can tell you what the nth prime is.

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

=begin

input: integer
output: integer, nth prime number
problem:
- fill an array of primes up to nth (size of array)
- return the last prime number in the array
ALGO:
- initilize 'count' to 2
- initialize 'primes' to []
- define a method call 'is_prime?'
  - from 2 to (one less than) number
    - check to see if none of the number mod 'n' == 0
    - that would make it prime
- end
- loop:
  - until primes size is equal to 'nth'
    - add primes in the array
    - pass 'count' to is_prime? if true
    - increment 'count' by 1
  - end
- use [-1] to get the last number
=end

# def is_prime?(number)
#   (2...number).none? { |n| number % n == 0 }
# end

# def nth_prime(nth)
#   primes = []
#   count = 2
  
#   until primes.size == nth
#     primes << count if is_prime?(count)
#     count += 1
#   end
  
#   primes[-1]
# end


# p nth_prime(6) == 13
# p nth_prime(2) == 3
# p nth_prime(4) == 7
# p nth_prime(5) == 11
# p nth_prime(1) == 2

require 'pry'

def letter_changes(string)
  result = ""
  lower = ('a'..'z').to_a
  upper = ('A'..'Z').to_a
  
  string.each_char do |char|
    if lower.include?(char)
      result << (lower.index(char) + 3) % 26
      binding.pry
    elsif upper.include?(char)
      result << upper.index(char) + 3 % 26
    else
      result << char
    end
  end
  result
end

p letter_changes("this long cake@&") #== "wklv orqj fdnh@&"
p letter_changes("Road trip9") #== "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") #== "HPDLOC@jpdlo.frp"
p letter_changes('xyz') #== ('abc')
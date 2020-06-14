# Divisors

=begin
output: array of positive integer p divisors of argument
algo:
- create a range from 1 to n
- iterate over range
  - select number if n % number is 0
- return array
=end

def divisors(n)
  (1..n).select { |number| n % number == 0 }
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
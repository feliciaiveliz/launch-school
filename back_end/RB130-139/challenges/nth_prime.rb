=begin

input: integer, nth
output: integer, the nth number
problem:
- find all primes up to nth
- get the prime: it'll be the last number
algorithm:
- initialize 'primes' to []
- set a counter to 2
- loop do:
  - create a range from (2..(counter + 1))
    - next if 'counter' % n == 0 
    - primes << counter
  - end
  - break if primes.size == nth

=end

class Primes
  def self.nth(number)
    primes = []
    counter = 2

    (2..(counter + 1)).each do |n|
      next if counter % n == 0
      primes << n
      break if primes.size == number
    end
    primes
  end
end
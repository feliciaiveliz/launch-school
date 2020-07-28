=begin
input: integer (limit)
output: array of primes
algo: 
- create a range from 2 to 'limit' inclusive
- create an array composites
- start at 2; find all multiples of 2 (4, 6, 8, etc)
- outer loop: start at 'current_number' (2)
- inner loop: if 'n' + 1 % current_number == 0; add to composites
- return all_numbers - composites to get primes
=end

class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    composites = []
    all_numbers = (2..@limit).to_a
    all_numbers.each do |current_number|
      ((current_number + 1)..@limit).each do |n|
        composites << n if n % current_number == 0
      end
    end
    all_numbers - composites
  end
end

  # def initialize(limit)
  #   @limit = limit
  # end

  # def calculate_primes(number)
  #   (2...number).each do |n| 
  #     return false if number % n == 0
  #   end
  #   true
  # end
  
  # def primes
  #   (2..@limit).select do |n| 
  #     calculate_primes(n)
  #   end
  # end
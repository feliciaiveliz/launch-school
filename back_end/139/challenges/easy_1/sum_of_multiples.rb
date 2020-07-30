=begin
input: set of numbers; number limit
output: integer sum
algorithm:
- find the multiples of 'set of numbers' or 'number (3 or 5)' up to but not including 'limit'
  - for a list that only cntains 1 number
    - from 2...'limit' select numbers that are divisible by 3 or 5
    - add together and return sum
  - for a list that contains more than on number
    - for each number in 'list' 
    - from 2...'limit' select numbers that are divisible by 'current_list_number'
    - all together and return sum
=end

class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end

  def self.to(limit)
    (1...limit).select { |n| n % 3 == 0 || n % 5 == 0 }.sum
  end

  def to(limit)
    total = []
    @numbers.each do |number|
      total << (2...limit).select { |n| n % number == 0 }
    end
    total.flatten.uniq.sum
  end
end
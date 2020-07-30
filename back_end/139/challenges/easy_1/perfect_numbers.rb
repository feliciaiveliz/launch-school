=begin
input: integer number
output: string classification
algorithm:
- given a number, find all factors from 1 to one less than 'number'
- add all factors
- case sum: 
  - if less than 'number' then 'deficient'
  - if greater than 'number' than 'abundant'
  - if equal to 'number' than 'perfect'
=end

class PerfectNumber
  def self.classify(number)
    sum = (1...number).select { |n| number % n == 0 }.inject(:+)
    case
    when sum < number then 'deficient'
    when sum > number then 'abundant'
    else
      'perfect'
    end 
  end
end


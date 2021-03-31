=begin

input: integer number
output: string classification
problem:
- return 'deficient', 'perfect' or 'abundant' depending on the sum of factors
- create a range from 1 to one less than number 
- find all factors in between 
- calculate sum and determine classification based on sum
algorithm:
- raise StandardError is number is negative
- iterate from 1...number, given 'n'
  - select 'n' if number % n == 0
- invoke #sum on returned array
- if sum < number then 'deficient'
- if sum > number then 'abundant'
- else 'perfect'
=end

class PerfectNumber
  def self.classify(number)
    raise StandardError if number.negative?
    sum = (1...number).select { |n| number % n == 0 }.sum
    case 
    when sum < number then 'deficient'
    when sum > number then 'abundant'
    else 'perfect'
    end
  end
end

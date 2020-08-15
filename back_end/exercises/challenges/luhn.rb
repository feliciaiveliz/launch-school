=begin

input: integer
output: 
test 'addends' - array of integers of full number after doubling second digits
test 'checksum' - integer after calculating luhn algorithm and adding all digits
test 'valid?' - boolean value, determines if the number is a valid number after all calculations
test 'create' - integer after adding a check digit that makes the number valid
problem:
- 'addends' 
  - double second digits and return number in an array
- 'checksum' 
  - after calculations of 'addends' find total sum of numbers in array
  - return this number
- 'valid?' 
  - take final 'luhn' number and if number ends in 0 return true
- 'create'
  
algorithm:
- define 'addends'
  - put numbers into array iterate backwards with #with_index
  - if idx is odd?
    - initialize 'digit' = n * 2
    - n * 2 >= 10? ? 'digit' - 9 : 'digit'
  - else 'n'
  - return array
- define 'checksum'
  - use return value of 'addends' and add all numbers together
  - return value
- define 'create' class method
  - calculate luhn number with given number
  - find total of number given as argument
  - if number % 10 == 0 then return number
  - else 
    - calculate how much more numbers it will take to make the number modulo 0
    - create a range from 0 to 9 and assign the number given to number with the last digit as the current number from range
    - convert to string using #join and convert back to integer using #to_i
    - if new number is valid?, return number
    - else reassign number to the next current number as last digit as repeat process
=end

class Luhn
  def initialize(number)
    @number = number
  end

  def addends
    result = []
   @number.digits.each_with_index do |n, idx|
     if idx.odd?
      digit = n * 2
      digit >= 10 ? result << digit - 9 : result << digit
     else
      result << n
     end
    end
    result.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    (0..9).each do |x|
      n = number.digits.reverse.push(x).join.to_i
      return n if Luhn.new(n).valid?
    end
  end
end


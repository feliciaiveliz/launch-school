=begin

input: string phone number
output: string phone number
problem:
- if number < 10 digits, > 10 digits
  - return 10 0's
- if number 11 digits and first digit 1 
  - delete '1' and return last 10 digits
  - else return 10 0's
- if number == 10 digits then return number
- if number > 12 digits then bad number
- if number contains letters then bad number
algorithm:
- define 'number' instance method
  - delete anything from string that is not number or letter
  - initialize 'size' to size of number
  - if size < 10 or size > 11 return 10 0's
  - if string contains 'a'..'z' then return 10 0's
  - if string size is 11 && string[0] == 1 
      string slice!(0) and return number
    - else return 10 0s
- define 'area_code'
  - slice off numbers from 0 to 3 and return
- define 'to_s'
  - interpolate: "#{(string[0..2]) string[3..5] string[6..]1}"
=end

class PhoneNumber
  def initialize(number)
    number.delete!('^0-9a-z')
    @number = number
  end

  def number
    size = @number.size
    case 
    when size == 10 && !@number.match(/['a-z']/)
      return @number
    when size == 11 && @number[0] == '1'
      return @number[1..-1]
    else
      return '0000000000'
    end
  end
  
  def area_code
    number[0..2]
  end

  def middle_three
    number[3..5]
  end

  def last_four
    number[6..-1]
  end

  def to_s
    "(#{area_code}) #{middle_three}-#{last_four}"
  end
end




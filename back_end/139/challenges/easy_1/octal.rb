=begin
input: string integer
output: decimal integer
algorithm:
- initialize 'decimal' to 0
- initialize 'counter' to 0
- convert string to integer
- convert integer to an array of integers
- iterate:
  - given current number: current_number*(8**counter)
  - increment value of 'decimal' by above calculation
  - increment 'counter' by 1
- return 'decimal'
=end

class Octal
  BASE = 8 

  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 if @octal =~ /[^0-7]/
    decimal = 0
    @octal = @octal.to_i
    @octal.digits.each_with_index { |n, idx| decimal += n*(BASE**idx) }
    decimal
  end
end
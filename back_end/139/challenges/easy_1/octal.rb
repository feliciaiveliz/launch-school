=begin
input: string number
output: integer octal number
problem:
- multiply each digit starting from right by 0, 1, etc by 8
- add all new digits together to form octal number
algorithm:
- return 0 if the number is anything but 0-7
- initialize 'BASE' to 8
- initialize 'decimal' to 0
- convert string into number using #digits
- reverse number
- iterate using #each_with_index:
- given 'n' and index:
  - increment 'decimal' by n * (BASE**index)
- return decimal
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
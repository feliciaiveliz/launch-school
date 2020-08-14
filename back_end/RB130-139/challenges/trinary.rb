=begin
input: string number
output: integer decimal number
problem:
- only keep numbers 0-2
- multiply each digit by 3 ** 0, 1, etc.
- add all digits to form decimal number
algorithm:
- return 0 if trinary matches anything but 0-2
- initialize BASE to 3
- initialize 'decimal' to 0
- convert trinary to number and array using #digits
- iterate using #each_with_index, given 'n' and 'idx'
  - increment 'decimal' by n * (BASE ** index)
- return 'decimal'
=end

BASE = 3

class Trinary
  def initialize(trinary)
    @trinary = trinary
  end
  
  def to_decimal
    return 0 if @trinary =~ /[^0-2]/
    decimal = 0
    
    @trinary.to_i.digits.each_with_index do |n, idx|
      decimal += n * (BASE ** idx)
    end
    decimal
  end
end

p Trinary.new('112').to_decimal
p Trinary.new('100').to_decimal

# or

class Trinary
  BASE = 3

  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    return 0 if @trinary =~ /[^0-2]/
    @trinary = @trinary.to_i
    @trinary.digits.map.with_index { |n, idx| n * (BASE ** idx) }.sum
  end
end

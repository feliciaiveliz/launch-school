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

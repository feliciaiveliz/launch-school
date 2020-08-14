# You are given the following class that has been implemented:

class KrispyKreme
  attr_accessor :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    filling_string = @filling_type ? @filling_type : "Plain"
    glazing_string = @glazing ? " with #{@glazing}" : ''
    filling_string + glazing_string
  end
end

# And the following specification of expected behavior:

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1 # => "Plain"

puts donut2 # => "Vanilla"

puts donut3 # => "Plain with sugar"

puts donut4 # => "Plain with chocolate sprinkles"

puts donut5 # => "Custard with icing"

# Write additional code for KrispyKreme such that the puts statements will work as specified above.


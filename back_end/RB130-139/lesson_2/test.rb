require 'minitest/autorun'

# class EqualityTest < MiniTest::Test
#   def test_value_equality
#     str1 = "hi there"
#     str2 = "hi there"

#     assert_equal(str1, str2)
#     assert_same(str1, str2)
#   end
# end

class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end
  
  def ==(other) # assert_equal would fail without this method
    other.is_a?(Car) && name == other.name
  end
end

class CarTest < MiniTest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Felicia"
    car2.name = "Felicia"
    
    assert_equal(car1, car2) # this will pass
    assert_same(car1, car2) # this will fail
  end
end


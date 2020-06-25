require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

# # class CarTest < Minitest::Test
# #   def test_wheels
# #     car = Car.new
# #     assert_equal(4, car.wheels)
# #   end

# #   def test_bad_wheels
# #     skip
# #     car = Car.new
# #     assert_equal(3, car.wheels)
# #   end
# # end

# class Car < MiniTest::Test
#   # def setup
#   #   @car = Car.new
#   # end

#   def test_car_exists
#     assert(@car)
#   end
  
#   def test_wheels
#     assert_equal(4, @car.wheels)
#   end
  
#   def test_name_is_nil
#     assert_nil(@car.name)
#   end
  
#   def test_raise_initialize_with_arg
#     assert_raises(ArgumentError) do 
#       Car.new(name: "Felicia") # this passes
#     end
#   end
  
#   def test_instance_of_car
#     car = Car.new
#     assert_instance_of(Car, @car)
#   end
  
#   def test_includes_car
#     arr = [1, 2, 3]
#     arr << @car
  
#     assert_includes(arr, @car)
#   end
# end  

class CarTest < MiniTest::Test

  def test_car_exists
    car = Car.new
    assert(car)
  end

  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey")
    end
  end

  def test_instance_of_car
    car = Car.new
    assert_instance_of(Car, car)
  end

  def test_includes_car
    car = Car.new
    arr = [1, 2, 3]
    arr << car

    assert_includes(arr, car)
  end
end

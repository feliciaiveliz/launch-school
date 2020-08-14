require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

class CarTest < Minitest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  # def test_bad_wheels
  #   car = Car.new
  #   assert_equal(3, car.wheels)
  # end

  def test_car_exists
    car = Car.new
    assert(car)
  end

  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do 
      car = Car.new(name: "Felicia")
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

    assert_includes(arr, car) # assert_includes calls assert_equal in its implementation, and Minitest counts that call
    # as a separate assertion. For each assert_includes call, you will get 2 assertions, not 1.
  end

  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = 'Felicia'
    car2.name = 'Felicia'

    assert_equal(car1, car2)
  end
end


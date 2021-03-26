module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :model, :year
  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_off
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end
  
  def age
    puts "Your #{self.model} is #{years_old} years old!"
  end
  
  private
  
  def years_old
    Time.now.year - year
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    "My truck  is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

my_car = MyCar.new(2015, "chevrolet spark", "color")
puts my_car.year
puts my_car.color
puts my_car.model
my_car.speed_up(30)
my_car.current_speed
my_car.brake(20)
my_car.current_speed
my_car.shut_off
my_car.current_speed
my_car.spray_paint("black")
my_car.color
MyCar.gas_mileage(13, 351)
puts my_car.to_s
puts my_car.age
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

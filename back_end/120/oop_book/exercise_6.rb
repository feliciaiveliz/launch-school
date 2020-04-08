class MyCar
  attr_accessor :color, :year

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def display_color
    "#{color}"
  end

  def change_color(c)
    self.color = c
  end

  def spray_paint(c)
    self.color = c
    puts "You new #{c} paint job looks great!"
  end

  def display_year
    self.year
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelarate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_off
    @current_speed = 0
    puts "Let's park this bad boy!"
  end
end

spark = MyCar.new(2015, "Chevrolet Spark", "red")
puts spark
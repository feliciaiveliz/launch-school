# 3. Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow 

class MyCar
  attr_accessor :year, :color, :model, :current_speed

  def initialize(year, color, model, current_speed)
    @year = year
    @color = color
    @model = model
    @current_speed = current_speed
  end

  def speed_up
    current_speed + 30
  end

  def brake
    current_speed - current_speed
  end

  def shut_off
    current_speed - current_speed
  end

  def change_speeds(current_speed)
    @current_speed = current_speed
  end

  def info 
    "My #{year} #{color} #{model} is driving at a speed of #{current_speed} mph!"
  end
end

car = MyCar.new(2015, "Red", "Spark", 0)
puts car.info
puts car.change_speeds(20)
puts car.shut_off

# Launch School solution

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

spark = MyCar.new(2015, "Chevy Spark", "red")
puts spark.color
spark.spray_paint("black")
puts spark.color
puts spark.display_color
spark.change_color('black')
puts spark.display_color
puts spark.display_year

spark.speed_up(20)
spark.current_speed
spark.speed_up(20)
spark.current_speed
spark.brake(20)
spark.current_speed
spark.brake(20)
spark.current_speed
spark.shut_off
spark.current_speed

# Launch School

# class MyCar
#   attr_accessor :color
#   attr_reader :year
# end

# spark.color = 'black'
# puts spark.color
# puts spark.year
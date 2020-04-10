class MyCar
  attr_accessor :color
  attr_reader :year
  
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end
  
  def spray_paint(new_color)
    self.color = new_color
    puts "Check out my new #{color} paint job!"
  end
  
  def speed_up(number)
    @current_speed += number
    puts "You have accelerated to #{number} mph."
  end
  
  def brake(number)
    @current_speed -= number
    puts "You braked at #{number} mph."
  end
  
  def current_speed
    puts "You are now going #{@current_speed} mph."
  end
  
  def shut_off
    @current_speed = 0
    puts "Let's park!"
  end
end

my_car = MyCar.new("2015", "red", "spark")
puts my_car.year
puts my_car.color
# puts my_car.model
my_car.speed_up(30)
my_car.current_speed
my_car.brake(20)
my_car.current_speed
my_car.shut_off
my_car.current_speed
my_car.spray_paint("black")
my_car.color
=begin

You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.
Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

input: integer
ouput: array
rules: 
- switches will be numbered from 1 to 'n'
- switch is connected to one light = off
=end

# def initialize_lights(number_of_lights)
#   lights = Hash.new
#   1.upto(number_of_lights) {|number| lights[number] = 'off'}
#   lights
# end

# # { 1 => 'off', 2 => 'off' } etc.

# def on_lights(lights)
#   lights.select { |_position, state| state == 'on' }.keys
# end

# # [1, 3, 5] etc.

def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == 'off') ? 'on' : 'off'
    end
  end
end

def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(1000)

# another solution

def initialize_lights(number)
  lights = Hash.new
  (1..number).each { |n| lights[n] = 'off' }
  counter = 1

  loop do 
    lights.map do |position, state|
      if position % counter == 0
        if lights[position] == 'off'
          lights[position] = 'on'
        elsif lights[position] == 'on'
          lights[position] = 'off'
        end
      end
    end
    counter += 1
    break if counter > number
  end

  lights.select {|key, value| key if value == 'on' }.keys
end

p initialize_lights(1000)

=begin

You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

input: integer, 'n' number of lights
output: array of integers, lights that are 'on'
rules: 
- toggle light on 'n' repetition if light is a multiple of 'n'
- 1st rep: all lights are on
- 2nd rep: toggle 2, 4, 6, 8, 10
- 3rd rep: toggle 3, 6, 9
- 4th rep: toggle 4, 8
- 5th rep: toggle 5, 10
- 6th rep: toggle 6
- 7th rep: toggle 7
- 8th rep: toggle 8
- 9th rep: toggle 9
- 10th rep: toggle 10
data structure: 
- hash: 
  - keys are integers (lights)
  - values are 'on' or 'off'
algoritm: 
- create an array that holds numbers 1 to 'n'
  - (1..'n').to_a
- create an empty hash to hold values that represents switch status
  - switches = {}
- iterate over the array and create all key value pairs that reps.
  light numbers and their status
  - switches[item] = 'on'
- create a variable that represents 'on'
  - to toggle to off, force it to turn to opposite status
  - status = !status, status = true
- iterate over the hash and toggle the value status if number is a multiple of 'n'
  - from 1.upto(n)
    - if key (integer) is evenly divisible by 'n'
    - switches[key] = !status
- once I have hash that contains keys and their status
  - return an array for which all keys are pointing to the values 
    that are 'true'
  - select the keys and put them into a new array
=end

def toggle_lights(lights)
  keys = (1..lights).to_a
  switches = {}
  status = true
  keys.each { |item| switches[item] = !status }

  1.upto(lights) do |n|
    switches.each_pair do |key, value|
      switches[key] = !value if key % n == 0
    end
  end

  switches.select { |k, v| v == true }.keys
end

p toggle_lights(5)
p toggle_lights(10)
p toggle_lights(1000)


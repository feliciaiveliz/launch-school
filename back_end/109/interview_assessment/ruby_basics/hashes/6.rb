# Use Enumerable#map to iterate over numbers and return an array containing each number divided by 2. Assign the returned array to a variable named half_numbers and print its value using #p.

numbers = {
  high: 100, 
  medium: 50, 
  low: 10
}

half_numbers = numbers.map do |key, value|
  value / 2
end

p half_numbers
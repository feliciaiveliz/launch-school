my_array = [3, 5, 7, 9]

new_array = my_array.map do |num|
  num + 2
end

p my_array
p new_array
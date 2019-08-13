arr = [1, 2, 3, 4, 5, 6 ,7, 8, 9, 10]

# Use select method to extract all odd numbers and put it into a new array.
my_array = arr.select do |number|
  number % 2 != 0      # Will return true for odd nums because they cannot be divided evenly by 2, and false for even nums.
end

p my_array

# Or

my_array = arr.select do |num|
  num.odd?
end

p my_array

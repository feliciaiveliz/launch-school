=begin

Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

input: array of integer
output: float
rules: 
- array is not empty
- multiply all elements together, then divide by array size
show_multiplicative_average([3, 5])
The result is 7.500

show_multiplicative_average([6])
The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
The result is 28361.667
data structure: array
algorithm: 
- def show_multiplicative_average(array)
- call inject(:*) on array to multiply all elements
  - array.inject(:*)
- then divide that result by array.size
  - array.inject(:*) / array.size.to_f
- format avg format('%.3f', avg)
- "The result is #{avg}"
- end method
=end

def show_multiplicative_average(array)
  avg = array.inject(:*) / array.size.to_f
  avg = format('%.3f', avg)
  "The result is #{avg}"
end

# Or
def show_avg(array)
  avg = array.inject(:*) / array.size.to_f
  "The result is #{format('%.3f', avg)}"
end

p show_multiplicative_average([3, 5])

p show_multiplicative_average([6])

p show_multiplicative_average([2, 5, 7, 11, 13, 17])

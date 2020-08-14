=begin

Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

input: array of integers
output: float average
rules: 
- round result to 3 decimal places
- array will always be non-empty
- multiply all digits in array together
- divide that result by the number of elements
data structure: array, integer
pseudo-code: 
- create variable called result
- multiply the elements in the array
- divide the result by the size of the array
- round the result to 3 decimal places
- print the result
algorithm: 
- init. variable called 'result'
- call #inject on the array and pass in the binary operation :* to it
- divide that by array.size
- call #round(3) to get the right amount of decimals
=end

def show_multiplicative_average(array)
  result = (array.inject(:*).to_f / array.size)
  puts "The result is #{format('%.3f', result)}"
end

p show_multiplicative_average([3, 5])

p show_multiplicative_average([6])

p show_multiplicative_average([2, 5, 7, 11, 13, 17])

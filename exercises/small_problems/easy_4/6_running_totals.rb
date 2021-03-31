=begin
Write a method that takes an Array of numbers, and returns an Array with the same 
number of elements, and each element has the running total from the original Array.

inputs: array of integers
outputs: array of integers
rules: 
- returned array must contain same number of elements as original
- first number in array must stay the same 
- second number will be added to first, and new num will be second num in returned 
array
data structure: array
algorithm: 
- create running_total method w/ 'array' param
- initialize sum variable to 0
- call map on array 
- increment sum by the value
- end method
=end

def running_total(array)
  number_total = []
  counter = 0

  array.each do |num|
    number_total << counter += num
  end
  number_total
end

def running_total(array)
  sum = 0
  array.map { |number| sum += number }
end

def running_total(array)
  sum = 0
  array.each_with_object([]) do |num, array|
    array << sum += num
  end
end

p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20]) 
p running_total([3])
p running_total([]) 
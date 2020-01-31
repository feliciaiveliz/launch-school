=begin

Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.
A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

input: array of strings or integers
output: same array, completely sorted
rules: 
- bubble sort: 
  - each pair of consecutive elements is sorted
  - repeat until array is sorted
data structure: array
algorithm: 
- iterate over the array and pass in index
- if the current number is > than second number
  - sort number
- move on the the next numbers in array
- if the current integer is last number in array
  - compare current integer with number before it
- return the array
=end
require 'pry'

def bubble_sort!(array)
  loop do 
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
      end
      break unless swapped
    end
  nil
end

array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]


# array = [6, 2, 7, 1, 4]
# p bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]
# Write a method called none? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns false for all of the element values. Otherwise, it should return false.

def none?(array)
 array.each { |n| return false if yield(n) }
  true
end
  
p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true
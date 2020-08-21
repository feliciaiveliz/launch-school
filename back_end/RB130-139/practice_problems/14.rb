# Write a method called one? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for exactly one of the element values. Otherwise, it should return false.

def one?(array)
  count = 0
  array.each do |n| count += 1 if yield(n)
    return false if count > 1
  end
  count == 1
end
  
  p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
  p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
  p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
  p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
  p one?([1, 3, 5, 7]) { |value| true }           # -> false
  p one?([1, 3, 5, 7]) { |value| false }          # -> false
  p one?([]) { |value| true }                     # -> false
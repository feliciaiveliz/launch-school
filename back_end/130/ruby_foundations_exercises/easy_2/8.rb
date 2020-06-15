# max_by

def max_by(array)
  return nil if array.empty?
  
  highest_value = array.first
  largest_value = yield(highest_value)

  array[1..-1].each do |item|
    yielded_value = yield(item)
    if largest_value < yielded_value
      largest_value = yielded_value
      highest_value = item
    end
  end
  highest_value
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
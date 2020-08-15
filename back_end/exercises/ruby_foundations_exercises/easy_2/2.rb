# Zipper

def zip(a, b)
  result = []
  a.each_index { |idx| result << [a[idx], b[idx]] }
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

def reduce(array, default=0)
  counter = 0
  accumulator = default 

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end
  
  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, n| acc + n }
p reduce(array, 10) { |acc, n| acc + n }
p reduce(array) { |acc, n| acc + n if n.odd? } 
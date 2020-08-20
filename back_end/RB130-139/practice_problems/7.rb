def multiply(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1 
  end

  array
end

p multiply([1,2,3,4,5]) { |x| 'do nothing' }.select {|x| x.odd? }
def select(array)
  counter = 0
  new_array = []

  while counter < array.size
    if yield(array[counter])
      new_array << array[counter]
    end
    counter += 1
  end

  new_array
end

# Launch School version

def select(array)
  counter = 0
  result = []

  while counter < array.size
    current_element = array[counter]
    result << current_element if yield(current_element)
    counter += 1
  end

  result
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }
p select(array) { |num| puts num }
p select(array) { |num| num + 1 }
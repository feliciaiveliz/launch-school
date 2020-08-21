# each_cons (Part 1)

def each_cons(array)
  first_counter = 0
  second_counter = 1
  while second_counter < array.size
    yield(array[first_counter], array[second_counter])
    first_counter += 1
    second_counter += 1
  end
  nil
end

def each_cons(array)
  counter = 0
  while counter < array.size - 1
    yield(array[counter], array[counter + 1])
    counter += 1
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end

p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end

p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end

p hash == {'a' => 'b'}
p result == nil
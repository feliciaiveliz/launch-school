# [1, 2, 3].each { |num| puts num } # outputs 1 2 and 3 and returns the original calling object; [1, 2, 3]. This is so that developers can chain methods onto the return value

def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

each([1, 2, 3, 4, 5]) do |num|
  puts num * 2
end


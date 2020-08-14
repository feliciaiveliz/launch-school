# method implementation
def times(number)
  counter = 0
  while counter < number do 
    yield(counter)
    counter += 1
  end

  number # return original method argument to match behavior of Integer#times
end

# method invocation
times(5) do |num|
  puts num
end


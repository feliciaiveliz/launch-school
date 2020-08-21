# From-To-Step Sequence Generator

def step(first_number, last_number, step)
  current_number = first_number
  while current_number <= last_number do
    yield(current_number)
    current_number += step
  end
  current_number
end

def step(start_point, end_point, step)
  current_value = start_point
  loop do 
    yield(current_value)
    break if current_value + step > end_point
    current_value += step
  end
  current_value
end

def step(first, last, step)
  counter = 1
  
   until counter > last
    yield(counter)
    counter += step
  end
  
  counter
end

step(1, 10, 3) { |value| puts "value = #{value}" }

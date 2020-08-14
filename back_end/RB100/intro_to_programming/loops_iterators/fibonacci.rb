# The fibonacci function is being called from within itself two times.If you add all the ones and zeros, you will get the same answer when you run the code. 
def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

puts fibonacci(6)  
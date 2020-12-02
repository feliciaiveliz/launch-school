# Break down what is happening here.

words = ["hi", "bye"]

def d_method(arg1, &arg2)
  arg1.map(&arg2) 
end

p d_method(words, &:upcase) # => ["HI", "BYE"]
# What will this print and why?

a = 7 # local variable 'a' init. to a value of integer 7
array = [1, 2, 3] # local variable 'array' init. to array of integers 1, 2, 3

def my_value(ary)  # method definition- 'my_value' with parameter passed in 'ary'
  ary.each do |b| # method invocation- #each on ary, passing in each element to the block and assigning it to local variable 'b'
    a += b # increment a (7) by each element in array. 8, 9, 10
  end
end

my_value(array) # method call to 'my_value', passing in 'array' as argument to the method
puts a # outputting value of 'a'

# this will raise an exception. method definitions are self-contained w/ respect to local variables. Method invocation in this case is within the method definition, 
# therefore the code within will not be seen. 

a = 7
array = [1, 2, 3]

def my_value(ary, a) # parameter 'a' here and local variable 'a' on line 18 are two different variables pointing as same object- 7
  ary.each do |b| # we are reassigning 'a' local to the method, to a new object. 'a' in outer scope continues to point to 7, while 'a' local to method definition is pointing to something else. 
    a += b
  end
end

my_value(array, a)
puts a # 7



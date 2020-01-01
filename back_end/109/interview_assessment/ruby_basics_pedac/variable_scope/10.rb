# What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7
array = [1, 2, 3]

def my_value(ary)
  ary.each do |b|
    a += b
  end
end

my_value(array)
puts a # undefined method `+' for nil

# Local variable 'a' is not passed into the my_value method definition, therefore it is not available within the method definition and therefore 
# not available within the `#each` method invocation. 


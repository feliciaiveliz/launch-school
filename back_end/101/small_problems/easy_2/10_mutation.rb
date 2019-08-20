# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

 # Moe
 # Larry 
 # CURLY
 # SHEMP
 # HARPO
 # CHICO
 # GROUCHO
 # ZEPPO

# The changes that occured in array1 are reflected in array2 because they are both
# referencing the same String objects. 

# This feature can get you in trouble because you are not entirely sure if variables 
# are pointing to different objects or if they are pointing to the same objects. One way 
# help you avoid it is to call #object_id on the objects to see if they match throughout the 
# program. This way if they ever changed, you know you are dealing with a seperate object. 
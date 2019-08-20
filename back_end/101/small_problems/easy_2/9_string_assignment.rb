# Take a look at the following code: 

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# What does this code print out? Think about it for a moment before continuing.

# My answer:
Alice
Bob

name = 'Bob'  # 'Bob'
save_name = name  
name.upcase! # 'BOB'
puts name, save_name # 'BOB', 'BOB'

# Explain: In the first example, we are assigning the String whose value is 'Bob' to the name variable.
# Then we are assigning that same string to the variable save_name
# We are then assigning the String whose value is 'Alice' to the name variable
# name is still 'Bob' and save_name is 'Alice' because assigning detaches the original string from the save_name varialbe
# connects it with a new one. 
# In the second example, both variable are pointing to the same String object, (same place in memory) and thus are both mutated after the destructive version of upcase is called. 
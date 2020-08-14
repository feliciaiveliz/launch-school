# Take a look at the following code:

name = "Bob"
save_name = name
name = "Alice"
puts name, save_name

# What does this code print out? Think about it for a moment before continuing.

# Alice
# Bob

# Now, let's look at something a bit different:

name = "Bob"
save_name = name
name.upcase!
puts name, save_name

# BOB
# BOB


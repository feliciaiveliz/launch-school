# What is the difference between a Hash and an Array? 
# An array references its elements by zero indexing. A hash uses key-value pairs and it's referenced by key.  


# Reference by index. 
my_array = ['meow', 'woof']
p my_array[0]

# Reference by associating key with its corresponding value.
my_hash = {cat: 'meow', dog: 'woof'}
p my_hash[:cat]
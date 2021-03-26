# merge returns a new hash that contains the contents of the original hash and the hash you are merging with it. If there if no block, then duplicate keys will be that of the original.
# merge does not modify when it's called, but merge! does. 

# Merge example

pet = {name: "Gian"}
type = {type: "cat"}

puts pet.merge(type)
puts pet
puts type

puts pet.merge!(type)
puts pet
puts type
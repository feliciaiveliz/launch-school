h = {a:1, b:2, c:3, d:4}

# Get value of key "b."
h[:b]

# Add this key:value pair to hash. {e:5}
h[:e] = 5

# Delete all key:value pairs whose value is less than 3.5.
h.delete_if do |k, v|
  v < 3.5
end






a = ['white snow', 'winter wonderland', 'melting ice', 'slippery sidewalk', 'salted roads', 'white trees']

# String's split method splits the pairs into their own strings.
a = a.map do |words|
  words.split
end

# Flatten compresses all subarrays into one, one dimensional array.
a = a.flatten
print a

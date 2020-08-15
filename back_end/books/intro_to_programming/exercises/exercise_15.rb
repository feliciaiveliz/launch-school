# Use delete_if and String method start_with? to delete all words that begin with "s" or "w."

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']


# Deletes all words beginning with "s."
arr.delete_if do |words|
    words.start_with?("s")
  end
puts arr


# Deletes all words beginning with "s" and "w."
arr.delete_if do |words|
  words.start_with?("s", "w")
end

puts arr


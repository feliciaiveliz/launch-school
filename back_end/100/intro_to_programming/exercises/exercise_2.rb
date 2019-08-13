arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Use same array, but print out values greater than 5.
arr.each do |num|
  if num > 5 
    puts num
  end
end

# Or
arr.each { |num| puts num if num > 5 }
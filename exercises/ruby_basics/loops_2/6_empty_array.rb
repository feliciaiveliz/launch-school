# Given the array below, use loop to remove and print each name. Stop the loop once names doesn't contain any more elements.

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do 
  puts names.shift
  break if names.empty?
end

# Further Exploration

loop do 
  puts names.pop
  break if names.empty?
end

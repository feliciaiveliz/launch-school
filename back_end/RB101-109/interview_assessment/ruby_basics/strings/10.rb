# Using the following code, print true if colors includes the color 'yellow' and print false if it doesn't. Then, print true if colors includes the color 'purple' and print false if it doesn't.

colors = 'blue pink yellow orange'

puts colors.include?('yellow')
puts colors.include?('purple')

# Further Exploration

colors = 'blue boredom yellow'
puts colors.include?('red')
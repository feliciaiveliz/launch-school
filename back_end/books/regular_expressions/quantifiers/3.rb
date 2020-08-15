# Write a regex that matches any line of text that ends with a ?, but does not match a line that consists entirely of a single ?. Test it with the strings from the previous exercise.

# What's up, doc?
# Say what? No way.
# ?
# Who? What? Where? When? How?

/^.+\?$/

# or

/\b^.*\?$/
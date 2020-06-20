# Challenge: write a regex that matches a string that looks like a simple negated character class range, e.g., '[^a-z]'. (Your answer should match precisely six characters.) Test it with these strings:

# The regex /[^a-z]/i matches any character that is
# not a letter. Similarly, /[^0-9]/ matches any
# non-digit while /[^A-Z]/ matches any character
# that is not an uppercase letter. Beware: /[^+-<]/
# is at best obscure, and may even be wrong.

/\[\^[0-9A-Za-z]-[0-9A-Za-z]\]/

# or

/[\[][\^][0-9A-Za-z]-[0-9A-Za-z][\]]/

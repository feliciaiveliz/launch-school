# Challenge: Write a regex that matches an entire line of text that consists of exactly 3 words as follows:

# The first word is A or The.
# There is a single space between the first and second words.
# The second word is any 4-letter word.
# There is a single space between the second and third words.
# The third word -- the last word -- is either dog or cat.

# A grey cat
# The lazy dog
# The white cat
# A loud dog
# Go away dog
# The ugly rat
# The lazy, loud dog

/^(A|The)\s[a-zA-Z][a-zA-z][a-zA-Z][a-zA-Z]\s(dog|cat)$/

/^(A|The) [a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z] (dog|cat)$/
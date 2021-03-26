# Test the pattern /\s...\s/ from the previous exercise against this text (be sure to delete the previous text first):
# Observe that one of the three-letter words in this text match the pattern; it also matches 2 3. Why is it that this pattern doesn't include the three-letter words Doc, red, box, or Hup, but it does match 2 3?

# Doc in a big red box.
# Hup! 2 3 4

This highlights 'red' because it is a three char word delimited by whitespace.
Once it counts a whitespace another word in sequence can't use it.
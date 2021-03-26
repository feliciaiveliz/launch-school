# Write a regex that matches any word that contains at least three occurrences of the letter i. Test your regex against these strings:

# Mississippi
# ziti 0minimize7
# inviting illegal iridium

/\b([a-z]*i){3}[a-z]*\b/

# or

/\b[a-z]*i[a-z]*i[a-z]*i[a-z]*\b/i
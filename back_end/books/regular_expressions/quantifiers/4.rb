# Write a regex that matches any line of text that contains nothing but a URL. For this exercise, a URL begins with http:// or https://, and continues until it detects a whitespace character or end of line. Test your regex with these strings:

# http://launchschool.com/
# https://mail.google.com/mail/u/0/#inbox
# htpps://example.com
# Go to http://launchschool.com/
# https://user.example.com/test.cgi?a=p&c=0&t=0&g=0 hello
#     http://launchschool.com/

/^(http:\/\/|https:\/\/)\S*$/

/^https?:\/\/\S*$/

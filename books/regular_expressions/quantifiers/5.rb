# Modify your regex from the previous exercise so the URL can have optional leading or trailing whitespace, but is otherwise on a line by itself. To test your regex with trailing whitespace, you must add some spaces to the end of some lines in your sample text.

# http://launchschool.com/
# https://mail.google.com/mail/u/0/#inbox
# htpps://example.com
# Go to http://launchschool.com/
# https://user.example.com/test.cgi?a=p&c=0&t=0&g=0 hello
#     http://launchschool.com/

/^\s*https?:\/\/\S*\s*$/
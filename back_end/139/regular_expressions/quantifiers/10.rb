# Write a regex that matches lines of text that contain at least 3, but no more than 6, consecutive comma separated numbers. In this exercise, you can assume that the first number on each line is not preceded by a comma, and the last number is not followed by a comma. Test your regex against these strings:

# 123,456,789,123,345
# 123,456,,789,123
# 23,56,7
# 13,45,78,23,45,34
# 13,45,78,23,45,34,56

# Write a regex that matches lines of text that contain at least 3, but no more than 6, consecutive comma separated numbers. In this exercise, you can assume that the first number on each line is not preceded by a comma, and the last number is not followed by a comma. Test your regex against these strings:

# 123,456,789,123,345
# 123,456,,789,123
# 23,56,7
# 13,45,78,23,45,34
# 13,45,78,23,45,34,56

/^(\d+,){2,5}\d+$/

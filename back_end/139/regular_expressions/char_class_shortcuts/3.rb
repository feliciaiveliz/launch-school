# Write a regex that matches any four digit hexadecimal number that is both preceded and followed by whitespace. Note that 0x1234 is not a hexadecimal number in this exercise: there is no space before the number 1234.

# Hello 4567 bye CDEF - cdef
# 0x1234 0x5678 0xABCD
# 1F8A done

/\s\h\h\h\h\s/

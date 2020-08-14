# Write a method that finds the largest substring that
# is a palindrome within a string.


=begin

PROBLEM -
input: string
output: string, largest substring that is a palindrome
question: what should be done with input?
- iterate over string:
  - check if str is same as str reversed
  - return str if it is, if it's not: 
    - remove first letter, repeat previous steps
ALGORITHM - 
- iterate over string using #size and #times
- perform palindrome check:
  - IF string == string reverse
    - return string
  - ELSE
    - use #shift to remove first letter
    - perform palindrome check
    - return string if palindrome
- end
=end

def largest_palindrome(string)
  string = string.chars

  string.size.times do 
    if string == string.reverse
      return string.join
    else
      string.shift
      return string.join if string == string.reverse
    end
  end
end
p largest_palindrome("ppop") == "pop"
p largest_palindrome("stat") == "tat"
p largest_palindrome("hannah") == "hannah"

# first try: 15 minutes 5 seconds
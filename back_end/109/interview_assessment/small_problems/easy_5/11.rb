=begin

input: string
output: new string
rules:
- reverse the words of a string in place
- return a new string object
data structure: array, string
pseudo-code: 
- split string into an array of seperate words
- iterate over the array of words
- permanently reverse each word in the array
- convert the array into a string of words seperated by spaces
algorithm: 
- split string using #split which create an new array object of strings
- iterate using #each and reverse! each string that passes to the block
- convert the array of strings into a string using #join(' ')
=end

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(' ')
end

p spin_me('hello world')

# A new object was returned.
# #split converts the string into an array 
# We iterate over this new array and modify the objects within it, 
# however when we call #join, this returns to us a brand new string object.
=begin

input: string
output: string
rules: 
- return next to last word in string
- words are any sequence of blank characters
- string will contain at least two words
examples:
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'
data structure: string, array
algorithm: 
- define penultimate(string) method
- split word into array of words and save to 'word' variable
- reference -2 index of array which should return next to last word
- end method
further exploration: 
edge cases
- a string that contains an odd number of words
- if string is empty, empty string should be returned
- if string contains even number words, then simply reference the second to last
=end

def penultimate(string)
  word = string.split
  word[-2]
end

def penultimate(string)
  string.split[-2]
end

def penultimate(string)
  word = string.split
  if word.size < 2 || word.empty?
    puts 'Please provide a string of at least 2 words.'
    nil
  elsif word.size.even?
    middle = (word.size / 2) - 1
    word[middle]
  elsif word.size.odd?
    odd_middle = word.size / 2
    word[odd_middle]
  else
    word[-2]
  end
end

p penultimate('last word')
p penultimate('Launch School is great!')
p penultimate('My cat is so cute.')
p penultimate('')
p penultimate('meow')

## Had fun with this one

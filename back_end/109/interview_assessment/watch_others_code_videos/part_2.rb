# Write a method that will return a substring based on specified indices.

# def substring(string, start, finish = start)
#   string[start..finish]
# end

def substring(string)
  array = []
  string.size.times do |n|
    array << string[0..n]
  end
  array
end

# p substring("honey")
# p substring("honey")
# p substring("honey")
# p substring("honey")
# p substring("honey")

# p substring("honey", 0, 2) # "hon"
# p substring("honey", 1, 2) # "on"
# p substring("honey", 3, 9) # "ey"
# p substring("honey", 2) # "n"
# p substring("honey", 3) # "e"

# Write a method that finds all substrings in a string. No 1-letter words. 

def substrings(string)
  results = []
  0.upto(string.size) do |start|
    results << substring(string[start..-1])
  end
  results.flatten.select { |string| string.size >= 2 }
end

def palindrome?(string)
  string == string.reverse
end

def palindromes(string)
  substrings(string).select do |str|
    str if palindrome?(str)
  end
end

def largest_palindromes(string)
  palindromes(string).max_by { |str| str.size }
end

# or

def largest_palindromes(string)
  results = palindromes(string)
  longest = results[0]
  results.each do |word|
    longest = word if word.size > longest.size
  end
  longest
end

p largest_palindromes('ppop') 

# p substrings("band") # ['ba', 'ban', 'band', 'an', 'and', 'nd']
# p substrings("world") # ['wo', 'wor', 'worl', 'world', 'or', 'orl', 'orld', 'rld', 'ld',]
# p substrings("ppop") # ['pp', 'ppo', 'ppop', 'po', 'pop',]


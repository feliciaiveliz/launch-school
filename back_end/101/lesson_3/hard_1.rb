# Question 1: What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = "hello world"
end

greeting

# nothing is printed. The local variable 'greeting' is nil because it was initialized within the if statement,
# which renders it nil. It will throw an 'undefined method or local variable" exception. When you reference an
# uninitialized variable, Ruby will raise an exception.

# Question 2: What is the result of the last line in the code below?

greetings = { a: 'hi'}
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting # "hi there"
puts greetings # "hi there"

# {a=>"hi there"}
# String#<< is a destructive method, so it mutated the original 'greeting' object. 

# Question 3: In other practice problems, we have looked at how the scope of variables affects the modification of one "layer"
# when they are passed to another. To drive home the salient (important) aspects of variable scope and modification of one scope to another, consider
# the following simliar sets of code. What will be printed by each of these code groups?

# A)
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one" # one = "one"
two = "two" # two = "two"
three = "three" # three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # "one is: one"
puts "two is: #{two}" # "two is: two"
puts "three is: #{three}" #"three is: three"

# B)
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # "one is: one"
puts "two is: #{two}" # "two is: two"
puts "three is: #{three}" # "three: three"

# C)
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # "one is: two"
puts "two is: #{two}" # "two is: three"
puts "three is: #{three}" # three is: one"

# Question 4: Ben was tasked to write a simple ruby method to determine if an input string is an IP address 
# representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa 
# supplied Ben with a method called is_an_ip_number? that determines if a string is a numeric string between 
# 0 and 255 as required for IP numbers and asked Ben to use it.

=begin

Inputs: 
- a string
- contains numberic characters

Outputs: 
- "5.3.12.3"
- "23.4.45.7"

Rules:
- must contain more than 3 characters, but no more than 5 characters
- each number must be dot seperated
- numbers must be between 0 and 255

Data Structure: 
- dot_seperated_ip_address?
- while loop 
- loop

Algorithm: 
- * is_an_ip_address? method is supplied
- create dot_seperated_ip_address? method
- split string into array of seperated numbers and save it to dot_seperated_words var 
  - input_string.split('.') => ["23", "4", "45", "7"]
- return false inless dot_seperated_words.size == 4
- while dot_seperated_words.size > 0 do
  - word = dot_seperated_words.pop
  - break if the word is valid
    - return false unless is_an_ip_number?(word)
  - end method
  - true
- end method
end

Original:

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
=end

# Needed help with the logic:

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4 # this checks to see if the size of the ip address is equal to 4 before it enters while loop to check if the ip address is valid.
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word) # if word passes is_an_ip_number? check, then it's valid, otherwise it returns false.
  end
  return true
end

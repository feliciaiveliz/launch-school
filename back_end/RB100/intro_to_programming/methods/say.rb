puts "hello"
puts "hi"
puts "how are you"
puts "I'm fine"

# Send our information to the method.
def say(words)
  puts words
end

say "hello"
say "hi"
say "how are you"
say "I'm fine"


# The method is invoked by typing its name and passing in arguments. 
# Words local variable is scoped at method definition level, it cannot be referenced outside of the say method definition.


# If we wanted to add a . at the end of every string:
def say(words)
	puts words + '.'
end

say "hello"
say "hi"
say "how are you"
say "I'm fine"

# Restructuring so that it will work, whether its given parameters or not. 
def say(words='hello')
  puts words + '.'
end

say()
say "hi"
say "how are you"
say "I'm fine"




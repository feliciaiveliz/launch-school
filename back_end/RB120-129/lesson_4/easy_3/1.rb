# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

hello = Hello.new
puts hello.hi # Hello

hello = Hello.new
puts hello.bye # error, no method 'bye' for hello class

hello = Hello.new
puts hello.greet # error, no arguments passed to greet

hello = Hello.new
puts hello.greet("Goodbye") # Goodbye

puts Hello.hi # error, no class method defined
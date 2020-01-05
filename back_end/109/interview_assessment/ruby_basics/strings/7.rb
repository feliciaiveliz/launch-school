# Given the following code, invoke a destructive method on greeting so that Goodbye! is printed instead of Hello!.

greeting = 'Hello!'

greeting.replace('Goodbye!')
greeting.gsub!('Hello', 'Goodbye')

puts greeting
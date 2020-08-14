# Write a program that displays a welcome message, but only after the user enters the correct password, where the password is a string that is defined as a constant in your program. Keep asking for the password until the user enters the correct password.

PASSWORD = 'Meow'

loop do
  puts "Please enter your password: "
  input = gets.chomp
  
  if input == PASSWORD
    puts "Willkommen!"
    break
  else
    puts "Invalid password!"
  end
end

# or 

loop do 
  puts "Please enter your password: "
  input = gets.chomp
  break if input == PASSWORD
  puts "Invalid password!"
end

puts "Willkommen!"





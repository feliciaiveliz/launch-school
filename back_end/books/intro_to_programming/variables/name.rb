# name.rb; Ask user for their name, then print greeting with name included.

puts name = "What is your name?"
name = gets.chomp
puts "Howdy #{name}!"


# name.rb 1st modification; Print users name 10 times. 

10.times do 
  puts name
end


# name.rb 2nd modification

puts first_name = "What is your first name?"
first_name = gets.chomp

puts last_name = "Great! What is your last name?"
last_name = gets.chomp

puts "#{first_name} " + "#{last_name} is an awesome name!"



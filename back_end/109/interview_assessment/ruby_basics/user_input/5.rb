# Write a program that prints 'Launch School is the best!' repeatedly until a certain number of lines have been printed. The program should obtain the number of lines from the user, and should insist that at least 3 lines are printed.

lines = nil

loop do 
  puts "How many output lines do you want? Enter a number >= 3:"
  lines = gets.chomp.to_i
  break if lines >= 3
  puts "That's not enough lines!"
end

lines.times do 
  puts "Launch School is the best!"
end




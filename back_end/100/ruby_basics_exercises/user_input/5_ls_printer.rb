# Write a program that prints 'Launch School is the best!' repeatedly until a certain number of lines have been printed. The program should obtain the number of lines from the user, and should insist that at least 3 lines are printed.
# For now, just use #to_i to convert the input value to an Integer, and check that result instead of trying to insist on a valid number; validation of numeric input is a topic with a fair number of edge conditions that are beyond the scope of this exercise.

loop do 
  puts "How many output lines do you want? Enter a number >= 3: "
  lines = gets.chomp.to_i

  if lines < 3 
    puts "That's not enough lines."
  else
    lines.times { puts "Launch School is the best!" }
  break
  end
end

# or 

lines = nil
loop do 
  puts "How many output lines do you want? Enter a number >= 3: "
  lines = gets.chomp.to_i
  break if lines >= 3
  puts "That's not enough lines." if lines < 3
end

lines.times { puts "Launch School is the best!" }




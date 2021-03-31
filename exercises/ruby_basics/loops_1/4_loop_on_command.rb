# Modify the code below so the loop stops iterating when the user inputs 'yes'.

loop do 
  puts "Should I stop looping?"
  answer = gets.chomp
  break if answer == 'yes' # will exit the loop only if the answer is equal to 'yes'
  puts 'Please answer only "yes".' # providing an error message is better for user experience
end

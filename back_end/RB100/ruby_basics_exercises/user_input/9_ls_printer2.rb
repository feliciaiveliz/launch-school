# In an earlier exercise, you wrote a program that prints 'Launch School is the best!' repeatedly until a certain number of lines have been printed. Our solution looked like this:

# In an earlier exercise, you wrote a program that prints 'Launch School is the best!' repeatedly until a certain number of lines have been printed. Our solution looked like this:


loop do 
  input_string = nil
  num_of_lines = nil

  loop do 
    puts "How many output lines do you want? Enter a number >= 3. (Q to quit)"
    input_string = gets.chomp.downcase
    break if input_string == 'q'

    num_of_lines = input_string.to_i
    break if num_of_lines >= 3

    puts "That's not enough lines."
  end

  break if input_string == 'q'
  num_of_lines.times { puts "Launch School is the best!" }
end




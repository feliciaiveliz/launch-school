# In an earlier exercise, you wrote a program that prints 'Launch School is the best!' repeatedly until a certain number of lines have been printed. Our solution looked like this

loop do 
  number_of_lines = nil
  input_string = nil
  loop do 
    puts ">> How many output lines do you want? ' \ 
          'Enter a number >= 3: (Q to Quit): "
    input_string = gets.chomp.downcase
    break if input_string == 'q'

    number_of_lines = input_string.to_i
    break if number_of_lines >= 3
    puts ">> That's not enough lines."
  end

  break if input_string == 'q'

  while number_of_lines > 0
    puts "Launch School is the best!"
    number_of_lines -= 1
  end
end



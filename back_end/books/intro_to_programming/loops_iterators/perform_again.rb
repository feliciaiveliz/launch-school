# If you enter anything but 'Y' it will break out of the loop. If you enter 'Y', it will ask you the question again. It does this every time you enter 'Y.'
loop do 
  puts "Do you want to do that again?"
  answer = gets.chomp
  if answer != 'Y'
    break
  end 
end

begin
  puts "Do you want to do that again?"
  answer = gets.chomp
end while answer == 'Y'
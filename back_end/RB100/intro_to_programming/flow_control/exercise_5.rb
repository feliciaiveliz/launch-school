def eval_num(num)
  case 
  when num < 0
    puts "No negative numbers please!"
  when num <= 50
    puts "#{num} is between 0 than 50!"
  when num <= 100
    puts "#{num} is between 51 than 100!"
  else 
    puts "#{num} is more than 100!"
  end
end

puts "Please type in a number."
num = gets.chomp.to_i

eval_num(num)


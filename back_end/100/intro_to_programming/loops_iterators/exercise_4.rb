def countdown_method(number)
  if number <= 0
   puts number
  else
    puts number
    countdown_method(number-1)
  end
end

countdown_method(7)
countdown_method(25)
countdown_method(-9)

# **practice this one more
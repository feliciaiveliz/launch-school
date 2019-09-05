def has_a_lab?(word)
  if word =~ /lab/
    puts word
  else 
    puts "Nothing here"
  end
end

has_a_lab?("laboratory")
has_a_lab?("experiment")
has_a_lab?("Pans Labyrinth")
has_a_lab?("elaborate")
has_a_lab?("polar bear")

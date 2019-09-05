def all_caps(string)
  if string.length > 10
    string.upcase
  else
    string
  end
end

puts all_caps("Felicia Bacon")
puts all_caps("Vinton Bacon")
puts all_caps("Gian Bacon")


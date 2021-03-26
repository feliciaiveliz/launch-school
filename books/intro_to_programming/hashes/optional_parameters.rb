def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]}" + " years old and I live in #{options[:city]}."
  
end
end

greeting("Felicia")
greeting("Felicia", {age: 24, city: "San Antonio"})
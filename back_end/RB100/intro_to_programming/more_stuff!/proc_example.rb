# How to define a proc.
talk = Proc.new do 
  puts "I am talking."
end

talk.call

# Procs can take arguments if specified.
talk = Proc.new do |name|
  puts "I am talking to #{name}"
end

talk.call "Vin"
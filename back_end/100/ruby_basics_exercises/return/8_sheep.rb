# What will the following code print? Why? Don't run it until you've attempted to answer.

def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10 # last line in method, therefore return value
end

puts count_sheep

# it will print 0-4 10
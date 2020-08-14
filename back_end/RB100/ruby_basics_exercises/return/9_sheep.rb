# What will the following code print? Why? Don't run it until you've attempted to answer.

def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return # return didn't provide a value, thus nil is returned
    end
  end
end

p count_sheep # will print 0 1 2 nil


# What will the following code print? Why? Don't run it until you've attempted to answer.

def tricky_number
  if true
    number = 1 # only evaluted value in the 'if' clause
  else
    2
  end
end

puts tricky_number # 1
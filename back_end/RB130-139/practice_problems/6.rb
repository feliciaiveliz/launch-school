def example(arg1, block_to_proc)   # you can change this line
  arg1.map(&block_to_proc)
end

string = '!'

proc_object = proc { |el| "#{el}#{string}" }
  
p example(['hi', 'bye'], proc_object)     # you can change this line
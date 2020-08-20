def exclaim(array, &block) 
  value = '!'
  p array.map(&block) # ['hi!!!', 'bye!!!']
  p block.call(array) # ['hi!!!', 'bye!!!', '!!!'] 
end

value = '!!!'

exclaim(["hi", "bye"]) { |n| n << value }

value = '!!'
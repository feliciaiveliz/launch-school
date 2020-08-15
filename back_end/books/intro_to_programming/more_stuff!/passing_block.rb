# & in method definition means that the argument is a block, which must always be the last parameter in the method definition.
def take_block(&block)
  block.call
end

take_block do 
  puts "Block being called in the method!"
end


# Pass an argument as well as a block.
def take_block(number, &block)
  block.call(number)
end

number = 42
take_block(number) do |num|
  puts "Block being called in the method! #{num}"
end

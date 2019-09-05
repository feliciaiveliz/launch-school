def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

# The parameter block needs the & symbol. This converts the block to a proc and allows the method to pass the proc as a parameter.